class QrGeneratorController < ApplicationController
  
  def generate_qr
    @workshop_name = params[:workshop_name]
    @teacher_name = params[:teacher_name]
    @room = params[:room]
    @qr_code = "https://chart.googleapis.com/chart?cht=qr&chs=#{256}x#{256}&chl=#{SystemConfiguration.first.token}:#{params[:key]}"
    render layout: false
  end
  
end