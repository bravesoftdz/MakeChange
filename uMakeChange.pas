unit uMakeChange;

interface
uses Spring.Collections;

function MakeSomeChange(aAmount: integer; aCoins: IList<integer>): int64;

implementation
uses spring,math;

function MakeSomeChange(aAmount: integer; aCoins: IList<integer>): int64;

   function initTable(aX, aY: integer): TArray<TArray<int64>>;
   var J: integer;
   begin
      setlength(result, aX, aY);
       for J := 0 to length(result[0])-1 do
         result[0,J] := 1;
   end;

   procedure initList(lowVal, highVal: integer; aList: IList<integer>);
   var I : integer;
   begin
     for I := lowVal to highVal do
       aList.Add(I);
   end;

var
  table : TArray<TArray<int64>>;
  numCoins : integer;
//  I, J : integer;
  listI : IList<integer>;
  listJ : IList<integer>;
//  a, b : int64;
begin
  numCoins := aCoins.Count;
  table := initTable(aAmount+1, numCoins);
  listI := TCollections.CreateList<integer>;
  listJ := TCollections.CreateList<integer>;
  initList(1, aAmount, listI);
  initList(0, numcoins-1, listJ);

  listI.ForEach(procedure(const I: integer)
                begin
                  listJ.ForEach(procedure(const J: integer)
                                var a,b : int64;
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

//  for I in listI do
//    for J in listJ do
//  for I := 1 to aAmount do
//    for J := 0 to numCoins-1 do
//    begin
//      if i < aCoins[j] then
//        a := 0
//      else
//        a := table[i - aCoins[j],j];
//
//      if j < 1 then
//        b := 0
//      else
//        b:= table[i,j-1];
//
//      table[I,J] := a + b;
//    end;
  result := table[aAmount,numCoins-1];
end;

end.
