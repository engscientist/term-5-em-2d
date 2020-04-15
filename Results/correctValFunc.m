function [correctVal] = correctValFunc(vecInp)
correctValPos = 1;
correctValNeg = 1;
for myindex = 1 : 3
    correctValPos = correctValPos * (vecInp(myindex) <= vecInp(myindex + 1));
    correctValNeg = correctValNeg * (vecInp(myindex) >= vecInp(myindex + 1));
    correctVal = correctValPos + correctValNeg;
end
end

