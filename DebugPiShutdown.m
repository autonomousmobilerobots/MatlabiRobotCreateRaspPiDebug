function DebugPiShutdown(Ports)
%
%   The object 'serPort' must first be initialized with the 
%   CreatePiInit command 
%
% By: Liran 1/2019

% Before closing communication stop the robot in case it is moving
SetFwdVelAngVelCreate(Ports.create, 0,0);
pause(1);

% Send stop command to terminate the loop on the Pi
data_to_send = ('stop');
fwrite(Ports.create, data_to_send);
pause(1);
 
 
 % Clean up
try
    
    if (strcmp(Ports.create.status,'open'))
        fclose(Ports.create);
        pause(0.1);
    end
    	
    delete(Ports.create);
    
catch
    disp('WARNING:  Function did not terminate correctly.  Output may be unreliable.')
end

end