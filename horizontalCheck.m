function [winnerNum] = horizontalCheck(board)
% Determines if a horizontal match is made
    winnerNum = 0;
    % Checking each row from bottom to top
    for rows = 11:-2:1
        redCounter = 0;
        yellowCounter = 0;
        % Checking each column of each row
        for cols = 2:2:8
            for count = 0:2:6 % Counter checks for a horizontal sequence of 4
                if board(rows,cols+count) == "R" % Checks for red
                    redCounter = redCounter + 1;
                else
                    redCounter = 0; % Counter breaks if sequence is less than 4
                    break;
                end
            end
            if redCounter == 4 % Returns red as winner
                winnerNum = 1;
                break;
            end
        end

        % Checking for yellow
        for cols = 2:2:8
            if winnerNum == 1 % Skip checking for yellow if red has already won
                break;
            end
            for count = 0:2:6
                if board(rows,cols+count) == "Y" % Checks for yellow
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