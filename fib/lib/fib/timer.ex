defmodule Fib.Timer do
  def time(func, arg) do
    t0 = Time.utc_now()
    func.(arg)
    Time.diff(Time.utc_now(), t0, :millisecond)
  end
end
