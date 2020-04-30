function trendFollow = trendFollowFunc(c135,c140,c145,c150)
trendFollow1 = all((c135 < c140 & c140 < c145) & c145 < c150);
trendFollow2 = all((c135 > c140 & c140 > c145) & c145 > c150);
trendFollow = trendFollow1 + trendFollow2;
end

