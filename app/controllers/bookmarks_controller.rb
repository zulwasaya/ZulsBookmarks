class BookmarksController < ApplicationController

  require 'open-uri'
  require 'date'
  require 'logger'
  require "net/http"




#       logger = Logger.new('log/logfile.log')
#       logger.debug ("Log file logfile.log created")
#       @bookmarks.each {|mark|logger.debug mark.name}
#       logger.debug ("End of logfile.log")
#       logger.close


# GET /bookmarks
  # GET /bookmarks.json
  def index
#    Bookmark.destroy_all
#    @bookmarks = Bookmark.all
    unless session[:user_id]
      redirect_to root_url
      return
    end
# Get all bookmarks related to user where the primary key of User record is in session[:user_id]
    @bookmarks =User.find(session[:user_id]).bookmarks


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

  def searchform

    respond_to do |format|
      format.html # searchform.html.erb
      format.json { render json: @bookmark }
    end
  end

  def sortform

    respond_to do |format|
      format.html # sortform.html.erb
      format.json { render json: @bookmark }
    end
  end


  # GET /bookmarks/new
  # GET /bookmarks/new.json
  def new
    @bookmark = Bookmark.new
    @bookmark.user_id= session[:user_id]
    @bookmark.origin='database-created'
    @bookmark.url='http://'
    @bookmark.folder=[" "]

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
    @bookmark.user_id= session[:user_id]
# remove backslashes to reconstruct array
    @bookmark.folder = eval(@bookmark.folder)

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
# convert folder array to pure strings ie remove back-slash characters

#    @bookmark.folder.each {|f| f=eval(f)}

    @bookmark.modified_date=Time.now
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
    @bookmarks =User.find(session[:user_id]).bookmarks

#    Bookmark.destroy_all
    @bookmarks.destroy_all

#    folderArray=['ruby']
#    bookmarks= Bookmark.create([{origin: 'ruby on rails',name: 'Ruby on Rails',url: 'http://rubyonrails.org',
#        folder: folderArray,create_date: DateTime.now,visited_date: DateTime.now,modified_date: DateTime.now}])

    respond_to do |format|
      format.html { redirect_to bookmarks_path }
      format.json { head :no_content }
    end
  end

  def check_urls
    @bookmarks =User.find(session[:user_id]).bookmarks
#    @bookmarks = Bookmark.all

#    logger = Logger.new('log/logfile.log')
#    logger.debug ("Log file logfile.log created")
    @bookmarks.each do |href|
#      logger.debug (href.url)
      begin
#      hurl = URI.parse(href.url)
#      req = Net::HTTP.new(hurl.host, hurl.port)
#      res = req.request_head(hurl.path)
      rescue
#        logger.debug("url is not ok")
      end
    end
#    logger.debug ("End of logfile.log")
#    logger.close
      respond_to do |format|
        format.html { render action: "index" }# index.html.erb
        format.json { render json: @bookmarks }
      end

  end

  def sortbookmarks

    @sort_field="#{params[:sort]}"
    @sort_order="#{params[:sort_order]}"


    if @sort_field == 'create_date' or @sort_field == 'visited_date' or @sort_field == 'modified_date'
      @bookmarks = User.find(session[:user_id]).bookmarks(:order => ("#{params[:sort]}" +" " + "#{params[:sort_order]}") )

#      @bookmarks=Bookmark.all(:order => ("#{params[:sort]}" +" " + "#{params[:sort_order]}") )
#      logger.debug ("date fields")
    else
      @bookmarks = User.find(session[:user_id]).bookmarks(:order => ("lower(#{@sort_field})" +" " + " #{@sort_order}") )

#      @bookmarks=Bookmark.all(:order => ("lower(#{@sort_field})" +" " + " #{@sort_order}") )
#      logger.debug ("Non-date fields")
    end


#    logger.debug ("End of logfile.log")
#    logger.close
     respond_to do |format|
       format.html { render action: "index" }# index.html.erb
       format.json { head :no_content }
     end
  end

  def searchbookmarks

    @search_target="#{params[:target]}"
    @search_string="#{params[:search_string]}"

    @bookmarks = User.find(session[:user_id]).bookmarks.where("#{params[:target]} LIKE?","%#{params[:search_string]}%" )

#    @bookmarks=Bookmark.where("#{params[:target]} LIKE?","%#{params[:search_string]}%" )

    respond_to do |format|
      format.html { render action: "index" }# index.html.erb
      format.json { head :no_content }
    end
  end

  def oldfrom_html_file  # to database


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks.html"

      bookmarks = Markio::parse(File.open(file))


      bookmarks.each do |ref|
                             if ref.href
                               ref.href=ref.href.sub('https','http')
                             end

                             if ref.href and @bookmark= Bookmark.create(
       [{origin: 'From html file',name: ref.title,url: ref.href,folder: ref.folders.uniq,create_date: ref.add_date,visited_date: ref.last_visit,modified_date: ref.last_modified}])
                               format.html { render 'index', notice: 'Bookmark was successfully created.' }
                               format.json { render json: @bookmark, status: :created, location: @bookmark }
                             else
                               format.html { render action: "index" }
                               format.json { render json: @bookmark.errors, status: :unprocessable_entity }
                             end
                     end
   #   @bookmarks=Bookmark.all
      @bookmarks =User.find(session[:user_id]).bookmarks

    end

  end

  def backup_to_simple_html_file


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks_output.html"
      file = File.open(file, "w")

#      @bookmarks=Bookmark.all
      @bookmarks = User.find(session[:user_id]).bookmarks

#      @bookmarks = @bookmarks.sort_by {|x| [x.url, x.name] }
      file.write("<h1>Bookmarks HTML file</h1>"+"\n")

      if @bookmarks.each do |bookmark|
        file.write("<p><a href="+bookmark.url.to_s+">"+bookmark.name.to_s+"</a></p>"+"\n")

      end

        format.html { render 'index', notice: "Bookmarks were successfully filed "}
        format.json { render json: @bookmark, status: :created, location: @bookmark }

        file.close unless file == nil

      else
        format.html { render action: "index" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end

  end


  def to_html_file

      file= "app/assets/bookmarks/bookmarks_output.html"
      file = File.open(file, "w")
# Order records by folder case insensitive before writing out file
#      @bookmarks=Bookmark.all(:order => 'lower(folder) ASC')
      @bookmarks = User.find(session[:user_id]).bookmarks(:order => 'lower(folder) ASC')


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
      end
      respond_to do |format|
        format.html { render 'index', notice: "Bookmarks were successfully filed "}
        format.json { render json: @bookmark, status: :created, location: @bookmark }

        file.close unless file == nil

      end
  end

  def from_html_file  # to database




      file= "app/assets/bookmarks/bookmarks.html"

      bookmarks = Markio::parse(File.open(file))


      bookmarks.each do |ref|


        if ref.href
          ref.href=ref.href.sub('https','http')
          @bookmark=Bookmark.new
          @bookmark.user_id= session[:user_id]
          @bookmark.origin= 'From html file'
          @bookmark.name=ref.title
          @bookmark.url=ref.href
          @bookmark.folder=ref.folders.uniq
          @bookmark.create_date=ref.add_date
          @bookmark.visited_date=ref.last_visit
          @bookmark.modified_date=ref.last_modified
          @bookmark.save


        end
       end
#      @bookmarks=Bookmark.all
      @bookmarks = User.find(session[:user_id]).bookmarks
      respond_to do |format|
        format.html { render 'index', notice: "Bookmarks were successfully created "}
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      end

      end
  end


