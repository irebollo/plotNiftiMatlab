% Script to draw volumetric data in Matlab figure using spm functions
% irebollo 07-04-2020

%% Set paths
path2data='/home/irebollo/nimgtools/display/';
path2spm='/media/irebollo/storage/MatlabToolboxes/spm12';

addpath(path2spm);spm_defaults
cd path2data
%% Plot anatomy
Anatomy=[path2data 'mni152.nii']
global st % make st accesible to the environment

fg = spm_figure('GetWin','Graphics');% draw empty figures
spm_image('Reset');

% Draw 2 MNI brain in arbitrary locations
spm_orthviews('Image', Anatomy, [0.1 0.1 0.4 0.4]); 
spm_orthviews('Image', Anatomy, [0.55 0.1 0.4 0.4]);

%% Plot overlays

G1 = [path2data '/gradient map from MArgulies et al. 2016.nii'];
% downloaded from https://neurovault.org/images/31997/

% Set colormaps matrices for input into spm_orthviews
parula=colormap('parula')
linesmap=colormap('lines')
colormap('gray') % need to reset to gray colormap after calling other colormaps to avoid anatomy in overlay colormap

transparency=0.4;min=-5;max=7;
spm_orthviews('Addtruecolourimage',1,G1,parula,transparency,min,max)

Parcellation= [path2data '/HCP-MMP1_on_MNI152_ICBM2009a_nlin_hd.nii']
% downloaded from https://figshare.com/articles/HCP-MMP1_0_projected_on_MNI2009a_GM_volumetric_in_NIfTI_format/3501911

transparency=0.4;min=1;max=180
spm_orthviews('Addtruecolourimage',2,Parcellation,linesmap,transparency,min,max)

