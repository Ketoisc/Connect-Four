% Connect four with two players (Red and Yellow)
% Displays a 6 x 7 board in which two players can place colours (red and
% yellow) to try and make a horizontal, vertical or diagonal sequence of 4
% of their respective colour in a row.

clear
clc

repeatGame = 1; % initialisation, determines if game repeats or not

while repeatGame == 1
    % Prints instructions on how to play
    fprintf("Welcome to Connect 4! To win, a player must make a line of 4 with their respective colour (red or yellow) in the grid.\n");
    fprintf("To place down a colour, type in the number of the column you wish to place it in.\n\n");
    
    % Initialises win condition as false, and initialises all other variables
    win = 0;
    redRow = 1;
    yellowRow = 1;
    colPos = 2;
    redCol = 0;
    redColValid = 0;
    yellowColValid = 0;
    redCounter = 0;
    yellowCounter = 0;
    redColStringCheck = 0;
    yellowStringCheck = 0;
    winnerNum = 0; % 0 is no winner, 1 is red, 2 is yellow
    repeatGameVariable = "yes";
    validRepeatGameCheck = 0;

    % Prints the column numbers above the board
    for i = 1:7
        fprintf(" %d",i);
    end
    fprintf("\n\n");
    
    % Prints the empty board
    board = ['| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '
        ;'| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '
        ;'| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '
        ;'| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '
        ;'| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '
        ;'| ','| ','| ','| ','| ','| ','| ','| ';' -',' -',' -',' -',' -',' -',' -','  '];
    
    disp(board); 
    fprintf("\n\n");
    % Loop will continue until win condition is satisfied
    while win == 0
        for rounds = 1:21 % 42 slots to fill until board is full
            % Asks red player for input and checks validity
            redCol = input("It's red's turn! Which column will you place your colour in? (1-7): ","s");

            while redColValid ~= 1
                redColStringCheck = colStringCheck(redCol); % returns 1 if the input is a number, and 0 if not
                    if redColStringCheck == 0
                        redCol = input("Invalid input! Please enter a valid column number (1-7): ","s");
                    end
                    if redColStringCheck == 1
                        redCol = str2num(redCol);
                        colPos = colPosition(redCol); % calculates the position of the column in the matrix
                    end

                if redColStringCheck == 1 && (redCol < 1 || redCol > 7)
                    redCol = input("Invalid column! Please enter a valid column (1-7): ","s");

                % Checks if column number is full and asks for new input if full
                elseif redColStringCheck == 1 && board(1,colPos) ~= " "
                    redCol = input("This column is full! Please enter a valid column (1-7): ","s");
    
                elseif redColStringCheck == 1 && redCol >= 1 && redCol <= 7 && board(1,colPos) == " "
                    redColValid = 1; % Breaks out of loop if input is valid
                end
            end
        
            % Calculates which row to place red in
            for rows = 11:-2:1
                % Detects if column is free and what row to place red in
                if board(rows,colPos) == " "
                    redRow = rows;
                    break;
                end
            end
            
            % Places R into calculated position
            board(redRow,colPos) = "R";
    
            % Prints column numbers
            fprintf("\n\n");
            for i = 1:7
                fprintf(" %d",i);
            end
            fprintf("\n\n");
    
            % Displays board
            disp(board);
            redColValid = 0; % Resets value to 0 to prepare for next loop iteration's input
    
    
            % Checking for a sequence of 4 in any direction for both red and
            % yellow. winnerNum determines the winner (1 is red, 2 is yellow).
            % Breaks out of loop if winner is found.
            
            % Checking for horizontal match after red input
            winnerNum = horizontalCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for vertical match after red input
            winnerNum = verticalCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for diagonal match (lower left to upper right) after red input
            winnerNum = diagonalRightCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for diagonal match (lower right to upper left) after red input
            winnerNum = diagonalLeftCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Asks yellow player for input and checks validity
            yellowCol = input("It's yellow's turn! Which column will you place your colour in? (1-7): ","s");

            while yellowColValid ~= 1
                yellowColStringCheck = colStringCheck(yellowCol); % returns 1 if the input is a number, and 0 if not
                    if yellowColStringCheck == 0
                        yellowCol = input("Invalid input! Please enter a valid column number (1-7): ","s");
                    end
                    if yellowColStringCheck == 1
                        yellowCol = str2num(yellowCol);
                        colPos = colPosition(yellowCol); % calculates the position of the column in the matrix
                    end

                if yellowColStringCheck == 1 && (yellowCol < 1 || yellowCol > 7)
                    yellowCol = input("Invalid column! Please enter a valid column (1-7): ","s");

                % Checks if column number is full and asks for new input if full
                elseif yellowColStringCheck == 1 && board(1,colPos) ~= " "
                    redCol = input("This column is full! Please enter a valid column (1-7): ","s");
    
                elseif yellowColStringCheck == 1 && yellowCol >= 1 && yellowCol <= 7 && board(1,colPos) == " "
                    yellowColValid = 1; % Breaks out of loop if input is valid
                end
            end
        
            % Calculates which row to place yellow in
            for rows = 11:-2:1
                % Detects if column is free and what row to place yellow in
                if board(rows,colPos) == " "
                    yellowRow = rows;
                    break;
                end
            end
    
            % Places Y into calculated position
            board(yellowRow,colPos) = "Y";
    
            % Prints column numbers
            fprintf("\n\n");
            for i = 1:7
                fprintf(" %d",i);
            end
            fprintf("\n\n");
    
            % Displays board
            disp(board);
            yellowColValid = 0; % Resets value to 0 to prepare for next loop iteration's input
        
            % Checking for horizontal match after yellow input
            winnerNum = horizontalCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for vertical match after yellow input
            winnerNum = verticalCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for diagonal match (lower left to upper right) after yellow input
            winnerNum = diagonalRightCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            % Checking for diagonal match (lower right to upper left) after yellow input
            winnerNum = diagonalLeftCheck(board);
            if winnerNum == 1 || winnerNum == 2
                win = 1;
                break;
            end
    
            if rounds == 21 % If grid is full, break out of loop
                win = 1;
                break;
            end
        end
    end
    
    % Determining the winner and printing results
    if winnerNum == 0
        fprintf("Game over, grid is full!\n");
    elseif winnerNum == 1
        fprintf("Game over! Red is the winner!\n");
    elseif winnerNum == 2
        fprintf("Game over! Yellow is the winner!\n");
    end

    % Asking user if they want to play again
    repeatGameInput = input("Play again? (Enter yes or no)\n","s");
    repeatGameVariable = lower(repeatGameInput); % changes string input to lowercase
    % Checking for valid input
    while validRepeatGameCheck ~= 1
        if repeatGameVariable == "yes"
            repeatGame = 1; % Repeats game
            break;
        elseif repeatGameVariable == "no"
            repeatGame = 0; % Ends game
            break;
        else
            repeatGameInput = input("Invalid input! Play again? (Enter yes or no)\n","s"); % Prompts user again for valid input
            repeatGameVariable = lower(repeatGameInput);
        end
    end
end
