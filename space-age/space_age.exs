defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / orbital_period(planet)
  end

  def orbital_period(:earth),   do: 31557600
  def orbital_period(:mercury), do: orbital_period(:earth) * 0.2408467
  def orbital_period(:venus),   do: orbital_period(:earth) * 0.61519726
  def orbital_period(:mars),    do: orbital_period(:earth) * 1.8808158
  def orbital_period(:jupiter), do: orbital_period(:earth) * 11.862615
  def orbital_period(:saturn),  do: orbital_period(:earth) * 29.447498
  def orbital_period(:uranus),  do: orbital_period(:earth) * 84.016846
  def orbital_period(:neptune), do: orbital_period(:earth) * 164.79132
end
