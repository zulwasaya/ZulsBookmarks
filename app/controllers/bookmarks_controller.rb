class BookmarksController < ApplicationController

  require 'nokogiri'
  require 'open-uri'
  require 'date'
  require 'logger'

  # GET /bookmarks
  # GET /bookmarks.json
  def index
#    Bookmark.destroy_all
    @bookmarks = Bookmark.all


    if params[:sort]
      @bookmarks=Bookmark.all(:order => params[:sort])
    end

#       logger = Logger.new('log/logfile.log')
#       logger.debug ("Log file logfile.log created")
#       @bookmarks.each {|mark|logger.debug mark.name}
#       logger.debug ("End of logfile.log")
#       logger.close

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = Bookmark.new
    @bookmark.origin='database-created'
    @bookmark.url='http://'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookmark }
    end
  end


  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
    @bookmark.origin='database-updated'
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      else
        format.html { render action: "new" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy


#    if (@bookmark=Bookmark.all).blank?
#      folderArray=['ruby']
#      bookmarks= Bookmark.create([{origin: 'ruby on rails',name: 'Ruby on Rails',url: 'http://rubyonrails.org',
#                                   folder: folderArray,create_date: DateTime.now,visited_date: DateTime.now,modified_date: DateTime.now}])
#    end



    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  def destroy_all

    Bookmark.destroy_all
#    folderArray=['ruby']
#    bookmarks= Bookmark.create([{origin: 'ruby on rails',name: 'Ruby on Rails',url: 'http://rubyonrails.org',
#        folder: folderArray,create_date: DateTime.now,visited_date: DateTime.now,modified_date: DateTime.now}])

    respond_to do |format|
      format.html { redirect_to bookmarks_path }
      format.json { head :no_content }
    end
  end

  def newsearch


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks.html"
      doc = Nokogiri::HTML(open(file))

      links=doc.css("a")
      hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if{|href| href.empty?}
#      hrefs.each {|ref| logger.debug ref}

      hrefs.each {|ref| if  @bookmark= Bookmark.create([{origin: 'Bookmarks html file',name: 'Bookmarks',url: ref}])


        format.html { render 'index', notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      else
        format.html { render action: "index" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end  }
      @bookmarks=Bookmark.all
    end

  end
  def searchbookmarks
   @bookmarks=Bookmark.where('name LIKE?',"%#{params[:search_bookmarks]}%" )

     respond_to do |format|
       format.html { render action: "index" }# index.html.erb
       format.json { head :no_content }
     end
   end

  def from_html_file  # to database


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks.html"

      bookmarks = Markio::parse(File.open(file))


      bookmarks.each do |ref| if ref.href and @bookmark= Bookmark.create(
       [{origin: 'From html file',name: ref.title,url: ref.href,folder: ref.folders.uniq,create_date: ref.add_date,visited_date: ref.last_visit,modified_date: ref.last_modified}])
                               format.html { render 'index', notice: 'Bookmark was successfully created.' }
                               format.json { render json: @bookmark, status: :created, location: @bookmark }
                             else
                               format.html { render action: "index" }
                               format.json { render json: @bookmark.errors, status: :unprocessable_entity }
                             end
                     end
      @bookmarks=Bookmark.all
#      @bookmarks = @bookmarks.uniq.sort_by {|x| [x.url, x.name] }
    end

  end

  def backup_to_html_file


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks_output.html"
      file = File.open(file, "w")
      @bookmarks=Bookmark.all
#      @bookmarks = @bookmarks.sort_by {|x| [x.url, x.name] }
      file.write("<h1>Bookmarks HTML file</h1>"+"\n")

      if @bookmarks.each do |bookmark|
        file.write("<p><a href="+bookmark.url.to_s+">"+bookmark.name.to_s+"</a></p>"+"\n")

      end

        format.html { render 'index', notice: "Bookmarks were successfully filed to #(file) "}
        format.json { render json: @bookmark, status: :created, location: @bookmark }

        file.close unless file == nil

      else
        format.html { render action: "index" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end

  end


  def to_html_file



    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks_output.html"
      file = File.open(file, "w")
      @bookmarks=Bookmark.all(:order => 'lower(folder) ASC')


      if @bookmarks.each do |mark|

                          builder = Markio::Builder.new

                          builder.bookmarks << Markio::Bookmark.create({
                                                 :title => mark.name,
                                                 :href  => mark.url,
                                                 :folders=> mark.folder,
                                                 :add_date=>mark.create_date,
                                                 :last_visit=>mark.visited_date,
                                                 :last_modified=>mark.modified_date
                                             })


                          file_contents = builder.build_string
                          file.write file_contents
                        end

        format.html { render 'index', notice: "Bookmarks were successfully filed to #(file) "}
        format.json { render json: @bookmark, status: :created, location: @bookmark }

        file.close unless file == nil

      else
        format.html { render action: "index" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end
end
