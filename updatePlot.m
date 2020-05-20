function updatePlot(Mmean1, Mmean2, T1, T2, tempIndex, numSpinsPerDim, numTemps, timeElapsed)
    
    % Creating gif file
    f = figure;
    filename = 'MagFluctuations1.gif';

    % Plotting results for magnetic fluctuations for T1
    subplot(2,1,1);
    hold on
    plot(timeElapsed, Mmean1, 'b');
    axis([0 50 -1 1]);
    xlim auto;
    legend({['Temperature = ', num2str(T1)],...
           [num2str(tempIndex), ' iterations out of ' num2str(numTemps)],...
           [num2str(numSpinsPerDim) 'x' num2str(numSpinsPerDim) ' matrix'],...
           ['Average magnetisation = ' num2str(mean(Mmean1))]},...
            'Location', 'SouthWest')
    title('Mean magnetisation vs Time');
    xlabel('Time (seconds)');
    ylabel('Magnetisation');
    grid on;
    
    % Plotting results for magnetic fluctuations for T2
    subplot(2,1,2);
    hold on
    plot(timeElapsed, Mmean2, 'r');
    axis([0 50 -1 1]);
    xlim auto;
    legend({['Temperature = ', num2str(T2)],...
           [num2str(tempIndex), ' iterations out of ' num2str(numTemps)],...
           [num2str(numSpinsPerDim) 'x' num2str(numSpinsPerDim) ' matrix'],...
           ['Average magnetisation = ' num2str(mean(Mmean2))]},...
            'Location', 'SouthWest')
    xlabel('Time (seconds)');
    ylabel('Magnetisation');
    grid on;
        
    drawnow;
    
    
    frame = getframe(f);                % Capturing frame
    img = frame2im(frame);              % Converting frame to image format
    [imgind, cm] = rgb2ind(img, 256);   % Converting RGB image to indexed image
    
    % Writing frames to the GIF file 
    if tempIndex == 1 
        imwrite(imgind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imgind,cm,filename,'gif', 'WriteMode','append'); 
    end 
    close(f)

end