describe CountriesController do
  describe 'GET #index' do
    before { get :index }
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
  end

  describe 'GET #show' do
    before { get :show, id: create(:country) }
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :show }
  end

  context 'user logged in' do
    login_user

    describe 'POST #visit' do
      before { put :visit, id: create(:country) }
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :json }
      it { is_expected.not_to render_with_layout }
      it { is_expected.to render_template nil }
    end
  end

  context 'user logged in' do
    describe 'POST #visit' do
      before { put :visit, id: create(:country) }
      it { is_expected.to redirect_to new_user_session_path }
    end
  end
end
