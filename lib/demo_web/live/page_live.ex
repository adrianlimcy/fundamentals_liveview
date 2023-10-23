defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    # {:ok, assign(socket, number: 0, adding_amt_default: 8, form: to_form(%{}))}
    {:ok, assign(socket, number: 0, form: to_form(%{adding_amt_default: 8}))}
  end

  # def render(assigns) do
  #   ~H"""

  #   """
  # end

  # def test(assigns) do
  #   ~H"""
  #   This is a test
  #   """
  # end

  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("subtract", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number - 1)}
  end

  def handle_event("adding_more", %{"add_amount" => the_added_amt} , socket) do
    # {num, _reminder} = Integer.parse(the_added_amt)

    amt_to_add_by = case Integer.parse(the_added_amt) do
      {num, _r} -> num
      :error -> 0
    end

    {:noreply, assign(socket, number: socket.assigns.number + amt_to_add_by, form: to_form(%{adding_amt_default: amt_to_add_by}))}
  end
end
