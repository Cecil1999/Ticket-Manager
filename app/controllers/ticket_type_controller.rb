class TicketTypeController < ApplicationController
  before_action :admin_check, only: %i[ show edit create destory update ]
  before_action :set_ticket_type, only: %i[ show ]

  def show
  end

  def create
    @ticket_type = Ticket.new(ticket_type_params)

    respond_to do |format|

    end
  end

  # This actually will not 'destory' a ticket type. But it will disable it.
  def destory
  end

  def edit
    unless is_admin?
      head :forbidden
    end
  end

  def update
    unless is_admin?
      head :forbidden
    end
  end

  private
  def ticket_type_params
     params.expect(TicketType: [ :type_name ])
  end

  def set_ticket_type
    @ticket_type = TicketType.find(params.expect(:id))
  end

  def admin_check
    return unless is_admin?

    flash[:notice] = "Unexplained error occured. "

    respond_to do |format|
      format.html
      format.json
    end
  end
end
