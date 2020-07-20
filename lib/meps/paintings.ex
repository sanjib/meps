defmodule Meps.Paintings do
  @moduledoc """
  The Paintings context.
  """

  import Ecto.Query, warn: false
  alias Meps.Repo

  alias Meps.Paintings.Painting

  @doc """
  Returns the list of paintings.

  ## Examples

      iex> list_paintings()
      [%Painting{}, ...]

  """
  def list_paintings do
    from(p in Painting, order_by: [desc: p.adjusted_price])
    |> Repo.all
  end

  def list_by_artist(artist) do
    from(p in Painting, where: p.artist == ^artist, order_by: [desc: p.adjusted_price])
    |> Repo.all()
  end

  def list_by_century(century) do
    century_end = century * 100
    century_start = century_end - 99

#    IO.puts "century_start: #{century_start}"
#    IO.puts "century_start: #{century_end}"

    from(p in Painting,
      where: (p.year_start >= ^century_start and p.year_start <= ^century_end) or
             (p.year_end >= ^century_start and p.year_end <= ^century_end),
      order_by: [desc: p.adjusted_price])
    |> Repo.all()
  end

  @doc """
  Gets a single painting.

  Raises `Ecto.NoResultsError` if the Painting does not exist.

  ## Examples

      iex> get_painting!(123)
      %Painting{}

      iex> get_painting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_painting!(id), do: Repo.get!(Painting, id)

  @doc """
  Creates a painting.

  ## Examples

      iex> create_painting(%{field: value})
      {:ok, %Painting{}}

      iex> create_painting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_painting(attrs \\ %{}) do
    %Painting{}
    |> Painting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a painting.

  ## Examples

      iex> update_painting(painting, %{field: new_value})
      {:ok, %Painting{}}

      iex> update_painting(painting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_painting(%Painting{} = painting, attrs) do
    painting
    |> Painting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a painting.

  ## Examples

      iex> delete_painting(painting)
      {:ok, %Painting{}}

      iex> delete_painting(painting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_painting(%Painting{} = painting) do
    Repo.delete(painting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking painting changes.

  ## Examples

      iex> change_painting(painting)
      %Ecto.Changeset{data: %Painting{}}

  """
  def change_painting(%Painting{} = painting, attrs \\ %{}) do
    Painting.changeset(painting, attrs)
  end
end
