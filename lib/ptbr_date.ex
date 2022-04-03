defmodule PtbrDate do

  @moduledoc """
  Módulo simples e específico apenas para adicionar '0'
  antes dos valores das datas menores que 10
  """

  @doc """
  Retorna a data e hora atual
  """

  @spec now() :: tuple()
  def now(), do: :calendar.local_time 

  @doc """
  Formata a data ou hora inserindo 0 antes
  dos valores menores que 10  
  """

  @spec format(
    {
      atom(), {
        year :: non_neg_integer(), 
        month :: non_neg_integer(),
        day :: non_neg_integer()
      }
    }
  ) :: String.t()
  def format({:date, {year, month, day}}) do
    add_zero({day, month, year})
    |> List.to_string
  end

  @spec format(
    {
      atom(), {
        hour :: non_neg_integer(), 
        minutes :: non_neg_integer(),
        seconds :: non_neg_integer()
      }
    }
  ) :: String.t()
  def format({:time, {hour, minutes, seconds}}) do
    add_zero({hour, minutes, seconds})
    |> List.to_string
  end

  @doc """
  Adiciona 0 antes do numero menor que 10
  """
  @spec add_zero(
    {
      first :: non_neg_integer(),
      second :: non_neg_integer(),
      third :: non_neg_integer()
    }
  ) :: String.t()
  defp add_zero({first, second, third}) do
    [first, second, third]
    |> Enum.map(fn v -> 
      case v do
        v when v < 10 -> "0" <> Integer.to_string(v)
        _ -> Integer.to_string(v)
      end
    end)
  end

end
