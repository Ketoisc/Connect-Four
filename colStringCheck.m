function [colStringValid] = colStringCheck(colInput)
    % Takes user input and returns if it is a number or not (1 if true, 0 if not true)
    spaceArray = isspace(colInput); % creates a boolean array where 1 is a space and 0 is not a space in the input
    spaceCheck = 1;

    % Checks for spaces in input
    for i = 1:length(spaceArray)
        if spaceArray(i) == 1
            spaceCheck = 0; % if there is at least 1 space, set as 0
            break;
        end
    end
    
    numericCheck = str2num(colInput); % converts input from string to number
    emptyCheck = isempty(numericCheck); % checks if converted input is empty
    integerCheck = 0;

    % Checks for integers
    if mod(numericCheck,1) == 0 % if number is an integer, set as 1
        integerCheck = 1;
    end

    % Determines if input is valid
    if (emptyCheck == 0) && (integerCheck == 1) && (spaceCheck == 1) % If the input is valid
        colStringValid = 1; % Returns the input as valid
    else
        colStringValid = 0; % Returns the input as invalid
    end
end

