% nuke - A dangerous command that obliterates the workspace and figures
%
%	NUKE clears the command window, deletes all currently open figures,
%	clears all instances of Matlab classes, stops and removes all timers,
%	and clears the workspace. This script is very useful when modifying
%	class definition files etc. where a simple "clear all" will not
%	suffice.
%
% USAGE:
%	nuke
%
% See also:
%	CLC, CLEAR, CLOSE
%
% Copyright (c) 2014, Jonathan Suever
% All rights reserved.

% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
%
%   1.  Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%
%   2.  Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in the
%       documentation and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
% IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
% THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
% PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
% CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
% PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%
% Forked version: Santiago I. Sordo-Palacios, 2019

% Close variable editors
closeVars();

% Close file editors
closeEdit();

% Close figure windows
closeFigs();

% We don't want to risk stopping the timers because we don't want StopFcn
% to be evaluated. Using DELETE bypasses the StopFcn
warning('off', 'MATLAB:timer:deleterunning');
delete(timerfindall)
warning('on', 'MATLAB:timer:deleterunning');

% If there is a variable called "all" in the workspace delete it first
if exist('all', 'var')
    clear('all') %#ok<CLALL>
end

% Close all open file handles
fclose('all');

% Clear all variables in the workspace
clear('variables')

% Unlock all m-files, mex-files so they can be cleared properly
munlock
clear('functions') %#ok<CLFUNC>

% Clear all the classes from Matlab's memory to reload definitions
clear('classes') %#ok<CLCLS>

% Clear globals
clear('global')

% Clear Java
clear('java') %#ok<CLJAVA>

% restore default paths and reruns tartup
restorePath();

% Move command window up
clc
