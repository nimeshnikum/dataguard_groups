class EventsController < ApplicationController
  before_action :load_event, except: :index

  def index
    @past_events = Event.completed
    @upcoming_events = Event.pending
  end

  def show
    @groups = @event.event_groups.includes(:event_group_members)
  end

  def generate_groups
    GroupGenerator.new(@event).generate!

    redirect_to @event
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end
end
