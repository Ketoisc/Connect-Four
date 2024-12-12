function [winnerNum] = diagonalLeftCheck(board)
% Determines if a diagonal match is made from lower right to upper left
    winnerNum = 0;
    % Checking each row from bottom to top
    for rows = 11:-2:7
        redCounter = 0;
        yellowCounter = 0;
        % Checking each column
        for cols = 14:-2:8 % Columns from right to left
            for count = 0:2:6 % Counter checks for a sequence of 4
                if board(rows-count,cols-count) == "R" % Checks for red in a diagonal sequence (one row up, one column to the left)
                    redCounter = redCounter + 1; % Counts the sequence of red
                else
                    redCounter = 0; % Resets counter if sequence is less than 4
                    break;
                end
            end
            if redCounter == 4
                winnerNum = 1; % Returns red as the winner
                break;
            end
        end

        % Checking for yellow
        for cols = 14:-2:8
            if winnerNum == 1 % If red has already won, skip checking for yellow
                break;
            end
            for count = 0:2:6
                if board(rows-count,cols-count) == "Y" % Checks for yellow in a diagonal sequence (one row up, one column to the left)
                    yellowCounter = yellowCounter + 1; % Counts the sequence of yellow 
                else
                    yellowCounter = 0; % Resets counter is sequence is less than 4
                    break;
                end

            end
            if yellowCounter == 4
                winnerNum = 2; % Sets winner as yellow if sequence is found
                break;
            end
        end
    end
end