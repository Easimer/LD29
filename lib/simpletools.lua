--SimpleTools by Easimer

function increment(v)
	return v + 1
end

function dTr(d)
	return d * 0.0174532925
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end