require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  test 'creating a booking successfully, with all fields filled properly' do
    login_as users(:george)
    visit home_path
    click_on 'Réserver'
    fill_in 'booking_first_name', with: 'Test User 1st Name'
    fill_in 'booking_last_name', with: 'Test User Last Name'
    fill_in 'booking_email', with: 'test.user@eunoe-restaurant.com'
    fill_in 'booking_phone', with: '0623456789'
    fill_in 'booking_date', with: '03-05-2023'
    select '20:00', from: 'booking_starts_at'
    select '4', from: 'booking_people'
    puts '>> Booking form filled successfully'

    if click_on('Valider')
      puts '>> Submit button found'
      sleep 5 and puts '>> Waiting for 5 seconds'
      assert_equal (home_path(locale: 'en') || home_path(locale: 'fr') || home_path), page.current_path
      assert_equal 'Test User 1st Name', Booking.last.first_name
      assert_equal 'Test User Last Name', Booking.last.last_name
      assert_equal '0623456789', Booking.last.phone
      puts '>> Booking created successfully'
    else
      puts '>> Submit button not found'
      assert_equal new_booking_path, page.current_path
      puts '>> Booking not created - error while clicking on submit button'
    end
  end
end
