defmodule Jingle.Podcast do
  use Jingle.Web, :model

  schema "podcasts" do
    field :structure, :string
    field :network, :string
    field :name, :string
    field :rate, :string
    field :notes, :string
    field :recording_day, :string

    has_many :campaigns, Jingle.Campaign
    timestamps(type: :utc_datetime)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:structure, :network, :name, :rate, :notes, :recording_day])
    |> validate_required([:structure, :network, :name, :rate, :notes, :recording_day])
  end
end
