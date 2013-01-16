class BookmarksController < ApplicationController

  require 'nokogiri'
  require 'open-uri'
#  require 'logger'
  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookmark }
    end
  end


  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
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

    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  def destroy_all
    @bookmark = Bookmark.all
    @bookmark.each {|bookmark| bookmark.destroy}
    bookmarks= Bookmark.create([{search: 'ruby on rails',name: 'Ruby on Rails',url: 'http://rubyonrails.org'}])

    respond_to do |format|
      format.html { redirect_to bookmarks_path }
      format.json { head :no_content }
    end
  end

  def newsearch


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks.html"
      doc = Nokogiri::HTML(open(file))
#     logger = Logger.new('log/logfile.log')
#     logger.debug ("Log file logfile.log created")
      links=doc.css("a")
      hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if{|href| href.empty?}
      hrefs.each {|ref| logger.debug ref}
#      logger.debug ("End of logfile.log")


#      logger.close
      hrefs.each {|ref| if  @bookmark= Bookmark.create([{search: 'Bookmarks html file',name: 'Bookmarks',url: ref}])
#      if  @bookmark= Bookmark.create([{search: 'ruby on rails',name: 'Ruby on Rails',url: 'rubyonrails.org'}])
#        @bookmarks=Bookmark.all

        format.html { render 'index', notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      else
        format.html { render action: "index" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end  }
      @bookmarks=Bookmark.all
    end

  end

  def from_html_file


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks.html"
      doc = Nokogiri::HTML(open(file))

      links=doc.css("a")
      hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort.delete_if{|href| href.empty?}
      hrefs.each {|ref| if  @bookmark= Bookmark.create([{search: 'Bookmarks html file',name: 'Bookmarks',url: ref}])
                          format.html { render 'index', notice: 'Bookmark was successfully created.' }
                          format.json { render json: @bookmark, status: :created, location: @bookmark }
                        else
                          format.html { render action: "index" }
                          format.json { render json: @bookmark.errors, status: :unprocessable_entity }
                        end  }
      @bookmarks=Bookmark.all
    end

  end

  def to_html_file


    respond_to do |format|

      file= "app/assets/bookmarks/bookmarks_output.html"
      file = File.open(file, "w")
      @bookmarks=Bookmark.all

      if @bookmarks.each {|bookmark| [bookmark.url].each {|mark| file.write("<p><a href="+mark+">"+mark+"</a></p>"+"\n")} }

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
