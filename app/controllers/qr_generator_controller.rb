class QrGeneratorController < ApplicationController
  
  def generate_qr
    @qr_code = "https://chart.googleapis.com/chart?cht=qr&chs=#{256}x#{256}&chl=#{SystemConfiguration.first.token}:#{params[:key]}"
    render layout: false
  end
  
end