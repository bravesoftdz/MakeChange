unit uMakeChange;

interface

function MakeSomeChange(aAmount: integer; aCoins: TArray<integer>): int64;

implementation
uses Spring.Collections;

function MakeSomeChange(aAmount: integer; aCoins: TArray<integer>): int64;

   function initTable(aX, aY: integer): TArray<TArray<int64>>;
   var J: integer;
   begin
      setlength(result, aX, aY);
      for J := 0 to length(result[0])-1 do
        result[0,J] := 1;
   end;

var
  table: TArray<TArray<int64>>;
  numCoins: integer;
  iterI: IEnumerable<integer>;
  iterJ: IEnumerable<integer>;
begin
  numCoins := length(aCoins);
  table := initTable(aAmount+1, numCoins);
  iterI := TEnumerable.Range(1, aAmount);
  iterJ := TEnumerable.Range(0,numcoins);
  iterI.ForEach(procedure(const I: integer)
                begin
                  iterJ.ForEach(procedure(const J: integer)
                                var a,b: int64;
                                begin
                                  if I < aCoins[J] then
                                    a := 0
                                  else
                                    a := table[I - aCoins[J],J];

                                  if J < 1 then
                                    b := 0
                                  else
                                    b := table[I,J-1];

                                  table[I,J] := a + b;
                                end);
                end);
  result := table[aAmount,numCoins-1];
end;

end.
