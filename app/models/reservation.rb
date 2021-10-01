class Reservation < ApplicationRecord
  validates_acceptance_of :confirming
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "は本日以降の日付を入力してください")
    end
  end
  validates :finish_date, presence: true
  validate :start_end_check
  def start_end_check
    errors.add(:finish_date, "はチェックインより過去の日付は登録できません") unless
    self.start_date <= self.finish_date 
  end
  validates :ppl, numericality: {only_integer: true, greater_than: 0, message:"を入力してください"}

end
