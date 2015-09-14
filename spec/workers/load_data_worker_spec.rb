describe LoadDataWorker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable false }
  it { is_expected.to save_backtrace true }
  it { is_expected.to be_unique }
end
