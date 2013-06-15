require 'spec_helper'

describe SubscribersController do

  def valid_attributes
    FactoryGirl.attributes_for(:subscriber)
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all subscribers as @subscribers" do
      Subscriber.destroy_all
      subscriber = Subscriber.create! valid_attributes
      get :index, {}, valid_session
      assigns(:subscribers).should eq([subscriber])
    end
  end

  describe "GET show" do
    it "assigns the requested subscriber as @subscriber" do
      subscriber = Subscriber.create! valid_attributes
      get :show, {:id => subscriber.to_param}, valid_session
      assigns(:subscriber).should eq(subscriber)
    end
  end

  describe "GET new" do
    it "assigns a new subscriber as @subscriber" do
      get :new, {}, valid_session
      assigns(:subscriber).should be_a_new(Subscriber)
    end
  end

  describe "GET edit" do
    it "assigns the requested subscriber as @subscriber" do
      subscriber = Subscriber.create! valid_attributes
      get :edit, {:id => subscriber.to_param}, valid_session
      assigns(:subscriber).should eq(subscriber)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Subscriber" do
        expect {
          post :create, {:subscriber => valid_attributes}, valid_session
        }.to change(Subscriber, :count).by(1)
      end

      it "assigns a newly created subscriber as @subscriber" do
        post :create, {:subscriber => valid_attributes}, valid_session
        assigns(:subscriber).should be_a(Subscriber)
        assigns(:subscriber).should be_persisted
      end

      it "redirects to the created subscriber" do
        post :create, {:subscriber => valid_attributes}, valid_session
        response.should redirect_to(Subscriber.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subscriber as @subscriber" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        post :create, {:subscriber => {}}, valid_session
        assigns(:subscriber).should be_a_new(Subscriber)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        post :create, {:subscriber => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subscriber" do
        subscriber = Subscriber.create! valid_attributes
        # Assuming there are no other subscribers in the database, this
        # specifies that the Subscriber created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Subscriber.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => subscriber.to_param, :subscriber => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested subscriber as @subscriber" do
        subscriber = Subscriber.create! valid_attributes
        put :update, {:id => subscriber.to_param, :subscriber => valid_attributes}, valid_session
        assigns(:subscriber).should eq(subscriber)
      end

      it "redirects to the subscriber" do
        subscriber = Subscriber.create! valid_attributes
        put :update, {:id => subscriber.to_param, :subscriber => valid_attributes}, valid_session
        response.should redirect_to(subscriber)
      end
    end

    describe "with invalid params" do
      it "assigns the subscriber as @subscriber" do
        subscriber = Subscriber.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscriber.to_param, :subscriber => {}}, valid_session
        assigns(:subscriber).should eq(subscriber)
      end

      it "re-renders the 'edit' template" do
        subscriber = Subscriber.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscriber.to_param, :subscriber => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subscriber" do
      subscriber = Subscriber.create! valid_attributes
      expect {
        delete :destroy, {:id => subscriber.to_param}, valid_session
      }.to change(Subscriber, :count).by(-1)
    end

    it "redirects to the subscribers list" do
      subscriber = Subscriber.create! valid_attributes
      delete :destroy, {:id => subscriber.to_param}, valid_session
      response.should redirect_to(subscribers_url)
    end
  end

end
