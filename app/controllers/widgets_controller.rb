class WidgetsController < ApplicationController
    def index
    end

    def show
        render partial: 'tracker', locals: { tracker: Tracker.new }
    end

    def tracker
        @tracker = Tracker.new(tracker_params)
        p @tracker
        if @tracker.save
            # redirect_to widget_tracker_page_path, notice: "created!"
            # render json: { status: :ok }
            render partial: 'thankyou', locals: { tracker: @tracker }
        else
            # binding.break
            render partial: 'tracker', locals: { tracker: @tracker }
            # @errors = @tracker.errors.full_messages
            # render 'show'
        end
    end

    private

    def tracker_params
        params.permit(:name, :mobile, :message, :page_title, :host_url, :browser, :device)
    end
end