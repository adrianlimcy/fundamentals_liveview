defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    # {:ok, assign(socket, number: 0, adding_amt_default: 8, form: to_form(%{}))}
    {:ok, assign(socket, number: 0, form: to_form(%{adding_amt_default: 8}))}
  end

  def render(assigns) do
    ~H"""
    <%!-- <%= assigns.number %> --%>
    <%!-- instead of using assigns, you can use @ --%>
    <%= @number %>

    <%!-- <strong>Hello World!</strong> --%>
    <p>
      <.button phx-click="add">Add</.button>
    <space/>
      <.button phx-click="subtract">Subtract</.button>
    </p>

    <.simple_form for={@form} phx-submit="adding_more">
      <%!-- <.input field={@form[:add_amount]} value={@adding_amt_default} /> --%>
      <.input field={@form[:add_amount]} value={@form.params.adding_amt_default} />
      <.button>Add More</.button>
    </.simple_form>

    <p>
      <%= test("") %>
      <%!-- this is a shorthand to execute a local function --%>
      <.test/>
    </p>
    """
  end

  def test(assigns) do
    ~H"""
    This is a test
    """
  end

  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("subtract", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number - 1)}
  end

  def handle_event("adding_more", %{"add_amount" => the_added_amt} , socket) do
    {num, _reminder} = Integer.parse(the_added_amt)
    {:noreply, assign(socket, number: socket.assigns.number + num)}
  end
end
