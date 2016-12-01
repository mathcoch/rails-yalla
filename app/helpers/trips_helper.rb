module TripsHelper

  def panel_id(tripday)
    tripday.title.downcase.gsub(' ', '_')
  end

  def trip_type_class(trip)
    if trip.user == current_user
      "personal_trips"
    else
      "liked_trips"
    end
  end

  def trip_photo_index_path(trip)
    if trip.photo_url.nil?
      cl_image_path("watch_window_default.jpg", :height=>300, :width=>500, :crop=>"fill")
    else
      cl_image_path(trip.photo, width: 400, height: 300, crop: :fill)
    end
  end

  def trip_photo_index_tag(trip)
    if trip.photo_url.nil?
      cl_image_tag("watch_window_default.jpg", :height=>300, :width=>500, :crop=>"fill")
    else
      cl_image_tag(trip.photo, width: 400, height: 300, crop: :fill)
    end
  end

  def trip_photo_show_path(trip)
    if trip.photo_url.nil?
      cl_image_path("watch_window_default.jpg", :height=>350, :width=>1400, :crop=>"fill")
    else
      cl_image_path(trip.photo, width: 1400, height: 600, crop: :fill)
    end
  end

end
