% Tic Tac Toe Game
%
% Author: Annie Zarama
%
% Date: 10/08/2020
%
% Description: Play a game of tic tac toe: User versus the computer
%
% Developed on: MATLAB version 2020b, on Windows 10, Version 2004
%
%%

function bestTicTacToe ()

    while true
        disp("Welcome to Tic Tac Toe!")

        x = 0;
        while (x == 0)
            userInput = input('Would you like to play a game? Yes/No: ' , 's');
            if (strcmpi(userInput, 'No' ) == true || strcmpi(userInput, 'N' ) == true)
                disp('Ok. Come back again sometime!')
                return
            elseif (strcmpi(userInput, 'Yes' ) == true || strcmpi(userInput, 'Y' ) == true)
                disp('Let''s begin!')
                break
            else
                disp( 'I am sorry. I do not understand. Please respond "yes" or "no".')  
            end
        end
        firstPlayer = 'machine';
        while x == 0
            userInput = input('Would you like to go first? Yes/No: ' , 's');
            if (strcmpi(userInput, 'No' ) == true || strcmpi(userInput, 'N' ) == true)
                disp('Ok. My turn!')
                firstPlayer = 'machine' ; 
        %       This means the computer goes first
                break
            elseif (strcmpi(userInput, 'Yes' ) == true || strcmpi(userInput, 'Y' ) == true)
                disp('Ok. Your turn!')
                firstPlayer = 'person' ;
        %       This means user goes first
                break
            else
                disp( 'I am sorry. I do not understand. Please respond "yes" or "no".')  
            end
        end  

        gameMatrix = [   "T1" , "T2" , "T3" ; 
                         "M1" , "M2" , "M3" ; 
                         "B1" , "B2" , "B3" ];
         disp ( gameMatrix)

        for gameRound = 1 : 9
            if strcmp( firstPlayer, 'person') == true
                while (true)
                    gameInput = input( 'What is the cell location you would like to play?' , 's');
                    
%                         This if, elseif, elseif... else loop determines
%                         which gameboard location to assign the user's "x"
%                         icon. If the spot is already taken, it lets the
%                         user know that they cannot chose that spot and
%                         returns them to the original promt "What is the
%                         cell location you would like to play?"
                    
                    if (strcmpi (gameInput, "T1") == true)
                        if (strcmpi (gameMatrix (1, 1), "T1") == true)
                            gameMatrix (1, 1) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                    elseif (strcmpi (gameInput, "T2") == true)
                        if (strcmpi (gameMatrix (1, 2), "T2") == true)
                            gameMatrix (1, 2) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "T3") == true)
                        if (strcmpi (gameMatrix (1, 3), "T3") == true)
                            gameMatrix (1, 3) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "M1") == true)
                        if (strcmpi (gameMatrix (2, 1), "M1") == true)
                            gameMatrix (2, 1) = "x";
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "M2") == true)
                        if (strcmpi (gameMatrix (2, 2), "M2") == true)
                            gameMatrix (2, 2) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "M3") == true)
                        if (strcmpi (gameMatrix (2, 3), "M3") == true)
                            gameMatrix (2, 3) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "B1") == true)
                        if (strcmpi (gameMatrix (3, 1), "B1") == true)
                            gameMatrix (3, 1) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                     elseif (strcmpi (gameInput, "B2") == true)
                        if (strcmpi (gameMatrix (3, 2), "B2") == true)
                            gameMatrix (3, 2) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                    elseif (strcmpi (gameInput, "B3") == true)
                        if (strcmpi (gameMatrix (3, 3), "B3") == true)
                            gameMatrix (3, 3) = "x"; 
                            break
                        else 
                            disp( 'I am sorry, that place is taken.' )
                        end
                    else
                        disp( 'I am sorry, please select from one of the available board locations.' )
%                         This is in case they did not supply as input any
%                         of the possible gameboard locations in either
%                         upper or lower case.
                    end
                end
            else
                while (true)
                    machineTurn = randi ( [1, 9], 1);
%                     This directs the computer to select a random
%                     gameboard location to play.
                    if ( strcmp(gameMatrix(machineTurn), "x") == false && ...
                         strcmp(gameMatrix(machineTurn), "o") == false  )
                        gameMatrix(machineTurn) = "o";
%                         This checks to make sure the randomly selected
%                         gameboard location is available. If it is, it
%                         will assign the machine's marker of "o".
                        break
                    else
%                         If the location is not available, the machine
%                         will randomly select a new location until it
%                         finds one that is available.
                    end
                end
            end
            if strcmp(firstPlayer, 'machine') == true
                firstPlayer = 'person';
            else
                firstPlayer = 'machine';
            end
%             This statement tells the computer to alternate turns.

            disp( gameMatrix)
            
%             This next series if, elseif, elseif... else statements check
%             to see if there is a winner after each individual turn. If
%             there is, a statement is displayed to announce the winner. If
%             not, it notifies the player that the game is continuing. 

            if (strcmp (gameMatrix(1,1) , gameMatrix(1,2)) && ...
                strcmp (gameMatrix(1,2) , gameMatrix(1,3)))
                if strcmp( gameMatrix (1,1) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(2,1) , gameMatrix(2,2)) && ...
                strcmp (gameMatrix(2,2) , gameMatrix(2,3)))
                if strcmp( gameMatrix (2,1) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(3,1) , gameMatrix(3,2)) && ...
                strcmp (gameMatrix(3,2) , gameMatrix(3,3)))
                if strcmp( gameMatrix (3,1) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(1,1) , gameMatrix(2,1)) && ...
                strcmp (gameMatrix(2, 1) , gameMatrix(3,1)))
                if strcmp( gameMatrix (1, 1) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(1,2) , gameMatrix(2,2)) && ...
                strcmp (gameMatrix(2, 2) , gameMatrix(3,2)))
                if strcmp( gameMatrix (1, 2) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(1,3) , gameMatrix(2,3)) && ...
                strcmp (gameMatrix(2, 3) , gameMatrix(3,3)))
                if strcmp( gameMatrix (1, 3) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(1,1) , gameMatrix(2,2)) && ...
                strcmp (gameMatrix(2, 2) , gameMatrix(3,3)))
                if strcmp( gameMatrix (1, 1) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            elseif (strcmp (gameMatrix(1, 3) , gameMatrix(2,2)) && ...
                strcmp (gameMatrix(2, 2) , gameMatrix(3,1)))
                if strcmp( gameMatrix (1, 3) , "x" )
                    disp( 'Congratulations! You won!' )
                else
                    disp ( 'Womp womp. I WIN! Better luck next time.' )
                end
                break
            else
                disp(' You still have time! No one has won yet. ' )
            end
        end

        while true     
            userInput = input( 'Would you like to play again?' , 's' );
            if (strcmpi(userInput, 'No' ) == true || strcmpi(userInput, 'N' ) == true)
                disp( 'Too bad! I wanted another round. Come back soon!' )
                return
            elseif (strcmpi(userInput, 'Yes' ) == true || strcmpi(userInput, 'Y' ) == true)
                break
            else
                disp( 'I am sorry. I do not understand. Please respond "yes" or "no".')
            end
%             This asks the player if they want to play again or not.
        end

    end
end
