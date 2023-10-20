defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0)}
  end

  def render(assigns) do
    ~H"""
    <%!-- <%= assigns.number %> --%>
    <%!-- instead of using assigns, you can use @ --%>
    <%= @number %>

    <%!-- <strong>Hello World!</strong> --%>
    <p>
      <.button phx-click="add">Add</.button>
    </p>

    <p>
      <.button phx-click="subtract">Subtract</.button>
    </p>

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
end
