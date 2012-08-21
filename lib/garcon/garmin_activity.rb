class GarminActivity

  def initialize(activity_hash)
    @activity = activity_hash
  end
  
  def activity_id
    @activity["activityId"]
  end
  alias :id :activity_id

  def activity_url
    "http://connect.garmin.com/activity/#{@activity["activityId"]}"
  end
  
  def activity_summary_begin_timestamp
    @activity["activitySummaryBeginTimestamp"]["display"] if @activity.has_key?("activitySummaryBeginTimestamp")
  end
  alias :date :activity_summary_begin_timestamp
  
  def activity_type
    @activity["activityType"]["key"] if @activity.has_key?("activityType")
  end
  alias :type :activity_type
  
  def activity_name
    @activity["activityName"]["value"] if @activity.has_key?("activityName")
  end
  alias :title :activity_name  

  def activity_description
    @activity["activityDescription"]["value"] if @activity.has_key?("activityDescription")
  end
  alias :description :activity_description

  def activity_summary_sum_distance
    @activity["activitySummarySumDistance"]["value"] if @activity.has_key?("activitySummarySumDistance")
  end
  alias :distance :activity_summary_sum_distance

  def activity_summary_sum_duration
    @activity["activitySummarySumDuration"]["display"] if @activity.has_key?("activitySummarySumDuration")
  end
  alias :duration :activity_summary_sum_duration

  def activity_summary_weighted_mean_heart_rate
    @activity["activitySummaryWeightedMeanHeartRate"]["value"] if @activity.has_key?("activitySummaryWeightedMeanHeartRate")
  end
  alias :heartrate_avg :activity_summary_weighted_mean_heart_rate

  def activity_summary_max_heart_rate
    @activity["activitySummaryMaxHeartRate"]["value"]  if @activity.has_key?("activitySummaryMaxHeartRate")
  end
  alias :heartrate_max :activity_summary_max_heart_rate

end
