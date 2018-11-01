# require 'rails_helper'
#
# describe 'UserChanel' do
#
#   before do
#     @art = channel.create(name: "Derek Shepherd", department: "Neurosurgery")
#     @user = User.create(name: "Russell Wilson", age: 27)
#     @uc_one = UserChannel.create({user: @user, channel: @art})
#   end
#
#   it 'has a date and time' do
#     expect(@uc_one.appointment_datetime.strftime('%B %d, %Y')).to eq('December 25, 2016')
#   end
#
#   it 'belongs to a patient' do
#     expect(@uc_one.doctor).to be(@art)
#   end
#
#   it 'belongs to a doctor' do
#     expect(@uc_one.patient).to be(@user)
#   end
#
# end
