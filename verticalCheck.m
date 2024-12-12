function [winnerNum] = verticalCheck(board)
% Determines if a vertical match is made
    winnerNum = 0;
    % Checking each column from bottom to top
    for cols = 2:2:14
        redCounter = 0;
        yellowCounter = 0;
        % Checking each row of each column
        for rows = 11:-2:7
            for count = 0:2:6 % Counter checks for a vertical sequence of 4
                if board(rows-count,cols) == "R" % Checks for red
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
        for rows = 11:-2:7
            if winnerNum == 1 % Skips checking for yellow if red has already won
                break;
            end
            for count = 0:2:6
                if board(rows-count,cols) == "Y" % Checks for yellow
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