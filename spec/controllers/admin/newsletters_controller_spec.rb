require 'spec_helper'

describe Admin::NewslettersController do

  def valid_attributes
    FactoryGirl.attributes_for(:newsletter)
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all newsletters as @newsletters" do
      Newsletter.destroy_all
      newsletter = Newsletter.create! valid_attributes
      get :index, {}, valid_session
      assigns(:newsletters).should eq([newsletter])
    end
  end

  describe "GET show" do
    it "assigns the requested newsletter as @newsletter" do
      newsletter = Newsletter.create! valid_attributes
      get :show, {:id => newsletter.to_param}, valid_session
      assigns(:newsletter).should eq(newsletter)
    end
  end

  describe "GET new" do
    it "assigns a new newsletter as @newsletter" do
      get :new, {}, valid_session
      assigns(:newsletter).should be_a_new(Newsletter)
    end
  end

  describe "GET edit" do
    it "assigns the requested newsletter as @newsletter" do
      newsletter = Newsletter.create! valid_attributes
      get :edit, {:id => newsletter.to_param}, valid_session
      assigns(:newsletter).should eq(newsletter)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Newsletter" do
        expect {
          post :create, {:newsletter => valid_attributes}, valid_session
        }.to change(Newsletter, :count).by(1)
      end

      it "assigns a newly created newsletter as @newsletter" do
        post :create, {:newsletter => valid_attributes}, valid_session
        assigns(:newsletter).should be_a(Newsletter)
        assigns(:newsletter).should be_persisted
      end

      it "redirects to the created newsletter" do
        post :create, {:newsletter => valid_attributes}, valid_session
        response.should redirect_to(admin_newsletter_path(Newsletter.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved newsletter as @newsletter" do
        # Trigger the behavior that occurs when invalid params are submitted
        Newsletter.any_instance.stub(:save).and_return(false)
        post :create, {:newsletter => {}}, valid_session
        assigns(:newsletter).should be_a_new(Newsletter)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Newsletter.any_instance.stub(:save).and_return(false)
        post :create, {:newsletter => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested newsletter" do
        newsletter = Newsletter.create! valid_attributes
        # Assuming there are no other newsletters in the database, this
        # specifies that the Newsletter created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Newsletter.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => newsletter.to_param, :newsletter => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested newsletter as @newsletter" do
        newsletter = Newsletter.create! valid_attributes
        put :update, {:id => newsletter.to_param, :newsletter => valid_attributes}, valid_session
        assigns(:newsletter).should eq(newsletter)
      end

      it "redirects to the newsletter" do
        newsletter = Newsletter.create! valid_attributes
        put :update, {:id => newsletter.to_param, :newsletter => valid_attributes}, valid_session
        response.should redirect_to(admin_newsletter_path(newsletter))
      end
    end

    describe "with invalid params" do
      it "assigns the newsletter as @newsletter" do
        newsletter = Newsletter.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Newsletter.any_instance.stub(:save).and_return(false)
        put :update, {:id => newsletter.to_param, :newsletter => {}}, valid_session
        assigns(:newsletter).should eq(newsletter)
      end

      it "re-renders the 'edit' template" do
        newsletter = Newsletter.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Newsletter.any_instance.stub(:save).and_return(false)
        put :update, {:id => newsletter.to_param, :newsletter => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested newsletter" do
      newsletter = Newsletter.create! valid_attributes
      expect {
        delete :destroy, {:id => newsletter.to_param}, valid_session
      }.to change(Newsletter, :count).by(-1)
    end

    it "redirects to the newsletters list" do
      newsletter = Newsletter.create! valid_attributes
      delete :destroy, {:id => newsletter.to_param}, valid_session
      response.should redirect_to(admin_newsletters_url)
    end
  end

end
