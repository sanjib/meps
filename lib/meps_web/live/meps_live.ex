defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    ...

    """
  end
end