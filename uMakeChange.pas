unit uMakeChange;

interface
uses Spring.Collections;

function MakeSomeChange(aAmount: integer; aCoins: IList<integer>): int64;

implementation
uses math;

function MakeSomeChange(aAmount: integer; aCoins: IList<integer>): int64;

   function initTable(aX, aY: integer): TArray<TArray<int64>>;
   var J: integer;
   begin
      setlength(result, aX, aY);
       for J := 0 to length(result[0])-1 do
         result[0,J] := 1;
   end;

var
  table : TArray<TArray<int64>>;
  numCoins : integer;
  I, J : integer;
  a, b : int64;
begin
  numCoins := aCoins.Count;
  table := initTable(aAmount+1, numCoins);
  for I := 1 to aAmount do
    for J := 0 to numCoins-1 do
    begin
      if i < aCoins[j] then
        a := 0
      else
        a := table[i - aCoins[j],j];

      if j < 1 then
        b := 0
      else
        b:= table[i,j-1];

      table[I,J] := a + b;
    end;
  result := table[aAmount,numCoins-1];
end;

end.
