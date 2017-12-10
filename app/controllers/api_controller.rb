class ApiController < ApplicationController
respond_to :html, :xml

  def loginuser
    @user = User.where(:name => params[:name], :pass => params[:pass])
    @count = @user.size
    if @count < 1 then
     respond_with(0.to_s)
    else
     respond_with(1.to_s)
   end
  end

  def newuser
   @user = User.create(:name => params[:name], :pass => params[:pass])
   respond_with(@user)
  end

  def deleteuser
   @user = User.where(:name => params[:name], :pass => params[:pass])
   @count = @user.size
   @user.destroy_all
   respond_with(@count.to_s)
  end

  def edituser
   @user = User.where(:name => params[:name], :pass => params[:pass]).first
   User.update(@user.id, :name => params[:name_new], :pass => params[:pass_new]);
   respond_with(@user)
  end

  def getversion
    @date = Date.strptime(params[:date], '%d.%m.%Y')
    @ver = Version.all.order(:date).last
    if (@ver.date > @date) then
      respond_with(@ver)
    else
      respond_with(0.to_s)
    end
  end

  def addversion
    @date = Date.strptime(params[:date], '%d.%m.%Y')
    @ver = Version.create(:date => @date, :version => params[:version], :location => params[:location])
    respond_with(@ver)
  end

  def addlicence
   @key = LicenceKey.create(:key => params[:key])
   respond_with(@key)
  end

  def getdays
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1 then
     respond_with(0.to_s)
   elsif @key.first.endtime < Date.today then
     respond_with(0.to_s)
   else
     @diff = @key.first.endtime - Date.today
     respond_with(@diff.to_s)
   end
  end

  def getfrom
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1 then
     respond_with(0.to_s)
   else
     respond_with(@key.first.starttime.to_s)
   end
  end

  def checkkey
   @key = Key.where(:key => params[:key], :username => params[:user_name], :hddserial => params[:hdd_serial])
   if @key.size != 1 then
     respond_with(2.to_s)
   elsif @key.first.endtime > Date.today then
     respond_with(1.to_s)
   else
     respond_with(3.to_s)
   end
  end

  def registerkey
   @test = Key.where(:key => params[:key])
   if @test.size != 0 then
     respond_with(2.to_s)
   elsif LicenceKey.where(:key => params[:key]).size == 0 then
     respond_with(3.to_s)
   else
     @key = Key.create(:key => params[:key], :username => params[:user_name], :hddserial => params[:hddserial], :starttime => Date.today, :endtime => Date.today + 1.years)
     @user = User.create(:name => params[:name], :pass => params[:pass], :key => params[:key])
     respond_with(1.to_s)
   end
  end
end
