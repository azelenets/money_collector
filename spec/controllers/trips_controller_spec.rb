describe TripsController do
  describe 'GET #index' do
    before { get :index }
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
  end

  describe 'GET #show' do
    before { get :show, id: create(:trip) }
    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :show }
  end

  context 'user logged in' do
    login_user

    describe 'GET #new' do
      before { get :new }
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :html }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :new }
    end

    describe 'POST #create' do
      before { post :create, trip: attributes_for(:trip) }
      it { is_expected.to redirect_to trips_path }
    end

    describe 'DELETE #destroy' do
      before { delete :destroy, id: create(:trip) }
      it { is_expected.to redirect_to trips_path }
    end

    describe 'PUT #finish' do
      before { put :finish, id: create(:trip) }
      it { is_expected.to redirect_to trips_path }
    end
  end

  context 'user not logged in' do
    describe 'GET #new' do
      before { get :new }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe 'POST #create' do
      before { post :create, trip: attributes_for(:trip) }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe 'DELETE #destroy' do
      before { delete :destroy, id: create(:trip) }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe 'PUT #finish' do
      before { put :finish, id: create(:trip) }
      it { is_expected.to redirect_to new_user_session_path }
    end
  end
end
