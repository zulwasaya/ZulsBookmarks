class BookmarkMailer < ActionMailer::Base
  default from: "zul@digi-serve.co.uk"

  def bookmark_created(bookmark,email)
    @bookmarks=bookmark
    @email_string=email
    mail subject: "Zulsbookmarks", to: @email_string, bcc: 'zul_wasaya@yahoo.co.uk'
  end
end
