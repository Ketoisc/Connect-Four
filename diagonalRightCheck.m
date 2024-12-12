function [winnerNum] = diagonalRightCheck(board)
% Determines if a diagonal match is made from lower left to upper right
    winnerNum = 0;
    % Checking each row from bottom to top
    for rows = 11:-2:7
        redCounter = 0;
        yellowCounter = 0;
        % Checking each column
        for cols = 2:2:8
            for count = 0:2:6 % Counter checks for a sequence of 4
                if board(rows-count,cols+count) == "R" % Checks for red in a diagonal sequence (one row up, one column to the right)
                    redCounter = redCounter + 1;
                else
                    redCounter = 0; % Counter breaks if sequence is less than 4
                    break;
                end
            end
            if redCounter == 4 % Returns red as the winner
                winnerNum = 1;
                break;
            end
        end

        % Checking for yellow
        for cols = 2:2:8
            if winnerNum == 1 % If red has already won, skip checking for yellow
                break;
            end
            for count = 0:2:6
                if board(rows-count,cols+count) == "Y" % Checks for yellow in a diagonal sequence (one row up, one column to the right)
                    yellowCounter = yellowCounter + 1;
                else
                    yellowCounter = 0;
                    break;
                end

            end
            if yellowCounter == 4 % Returns yellow as the winner
                winnerNum = 2;
                break;
            end
        end
    end
end