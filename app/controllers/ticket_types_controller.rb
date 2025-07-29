class TicketTypesController < ApplicationController
  before_action :admin_check, only: %i[ show edit create destory update ]
  before_action :set_ticket_type, only: %i[ show edit update ]

  def show
  end

  def new
    @ticket_type = TicketType.new
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)

    respond_to do |format|
      if @ticket_type.save
        format.html { redirect_to admin_index_path, notice: "Ticket Type Was Created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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

    respond_to do |format|
      if @ticket_type.update(ticket_type_params)
        format.html { redirect_to @ticket_type, notice: "Ticket Type was saved." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def ticket_type_params
    params.expect(ticket_type: [ :type_name ])
  end

  def set_ticket_type
    @ticket_type = TicketType.find(params.expect(:id))
  end

  def admin_check
    return unless is_admin?

    flash[:notice] = "Unexplained error occured."

    respond_to do |format|
      format.html
    end
  end
end
