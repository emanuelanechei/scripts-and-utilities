#!/usr/bin/perl

use warnings;
use strict;

use File::HomeDir;
use Getopt::Long;

my $match = '';
my $help  = '';

GetOptions(
   'match=s' => \$match,
   'help'    => \$help
);


if ($help) {
   usage();
   exit;
}

my $lib_dir    ;
my $about_dir  ;
my $github_dir ;

if ($^O eq 'MSWin32') { # or MSWin64 ?
  $lib_dir     = 'c:/lib';
  $about_dir   = 'c:/about';
  $github_dir  = 'c:/github';
}
else {
  $lib_dir     = File::HomeDir -> my_home . '/github-lib';
  $about_dir   = File::HomeDir -> my_home . '/about';
  $github_dir  = File::HomeDir -> my_home . '/github';
}

my $exact = '';
if (@ARGV == 1) {

  if ($match) {

    usage();
    exit;
  
  }

  $exact = shift @ARGV;
}
elsif (@ARGV > 1) {

  usage();
  exit;

}

my %repos;

# $repos{'d3-threeD'     } = 'https://github.com/asutherland/d3-threeD';
$repos{'perl-Win32-OLE'              } = {url => 'https://github.com/ReneNyffenegger/perl-Win32-OLE'               , dir => $lib_dir   };
$repos{'js-keyboard-coordinates'     } = {url => 'https://github.com/ReneNyffenegger/js-keyboard-coordinates'      , dir => $lib_dir   };
$repos{'js-tablator'                 } = {url => 'https://github.com/ReneNyffenegger/js-tablator'                  , dir => $lib_dir   };
$repos{'js-vector-matrix'            } = {url => 'https://github.com/ReneNyffenegger/js-vector-matrix'             , dir => $lib_dir   };
$repos{'SendDirectoryWithMail'       } = {url => 'https://github.com/ReneNyffenegger/SendDirectoryWithMail'        , dir => $lib_dir   };
$repos{'scripts'                     } = {url => 'https://github.com/ReneNyffenegger/scripts-and-utilities'        , dir => $lib_dir   };
$repos{'runVBAFilesInOffice'         } = {url => 'https://github.com/ReneNyffenegger/runVBAFilesInOffice'          , dir => $lib_dir   };
$repos{'perl-tcp'                    } = {url => 'https://github.com/ReneNyffenegger/perl-tcp'                     , dir => $lib_dir   };

#                                      = {url => 'https://github.com/ReneNyffenegger/Windows-Pixel-Ruler'          , dir               };
$repos{'adodb'                       } = {url => 'https://github.com/ReneNyffenegger/about-adodb'                  , dir => $about_dir };
$repos{'coffeescript'                } = {url => 'https://github.com/ReneNyffenegger/about-coffeescript'           , dir => $about_dir };
$repos{'css'                         } = {url => 'https://github.com/ReneNyffenegger/about-css'                    , dir => $about_dir };
$repos{'cmd.exe'                     } = {url => 'https://github.com/ReneNyffenegger/about-cmd.exe'                , dir => $about_dir };
$repos{'dat.GUI'                     } = {url => 'https://github.com/ReneNyffenegger/about-dat.GUI'                , dir => $about_dir };
$repos{'Document-Object-Model'       } = {url => 'https://github.com/ReneNyffenegger/about-Document-Object-Model'  , dir => $about_dir };
$repos{'d3.js'                       } = {url => 'https://github.com/ReneNyffenegger/about-d3.js'                  , dir => $about_dir };
$repos{'GoogleEarth'                 } = {url => 'https://github.com/ReneNyffenegger/about-GoogleEarth'            , dir => $about_dir };
$repos{'html'                        } = {url => 'https://github.com/ReneNyffenegger/about-html'                   , dir => $about_dir };
$repos{'javascript'                  } = {url => 'https://github.com/ReneNyffenegger/about-javascript'             , dir => $about_dir };
$repos{'jqGrid'                      } = {url => 'https://github.com/ReneNyffenegger/about-jqGrid'                 , dir => $about_dir };
$repos{'jQuery'                      } = {url => 'https://github.com/ReneNyffenegger/about-jQuery'                 , dir => $about_dir };
$repos{'jQuery-UI'                   } = {url => 'https://github.com/ReneNyffenegger/about-jQuery-UI'              , dir => $about_dir };
$repos{'node.js'                     } = {url => 'https://github.com/ReneNyffenegger/about-node.js'                , dir => $about_dir };
$repos{'MapReduce'                   } = {url => 'https://github.com/ReneNyffenegger/about-MapReduce'              , dir => $about_dir };
$repos{'Open-Street-Map'             } = {url => 'https://github.com/ReneNyffenegger/about-Open-Street-Map'        , dir => $about_dir };
$repos{'perl'                        } = {url => 'https://github.com/ReneNyffenegger/about-perl'                   , dir => $about_dir };
$repos{'php'                         } = {url => 'https://github.com/ReneNyffenegger/about-php'                    , dir => $about_dir };
$repos{'Pig'                         } = {url => 'https://github.com/ReneNyffenegger/about-Pig'                    , dir => $about_dir };
$repos{'powershell'                  } = {url => 'https://github.com/ReneNyffenegger/about-powershell'             , dir => $about_dir };
$repos{'python'                      } = {url => 'https://github.com/ReneNyffenegger/about-python'                 , dir => $about_dir };
$repos{'README.md'                   } = {url => 'https://github.com/ReneNyffenegger/about-README.md'              , dir => $about_dir };
$repos{'r'                           } = {url => 'https://github.com/ReneNyffenegger/about-r'                      , dir => $about_dir };
$repos{'sqlite'                      } = {url => 'https://github.com/ReneNyffenegger/about-sqlite'                 , dir => $about_dir };
$repos{'Stellarium'                  } = {url => 'https://github.com/ReneNyffenegger/about-Stellarium'             , dir => $about_dir };
$repos{'svg'                         } = {url => 'https://github.com/ReneNyffenegger/about-svg'                    , dir => $about_dir };
$repos{'three.js'                    } = {url => 'https://github.com/ReneNyffenegger/about-three.js'               , dir => $about_dir };
$repos{'TopoJSON'                    } = {url => 'https://github.com/ReneNyffenegger/about-TopoJSON'               , dir => $about_dir };
$repos{'vim'                         } = {url => 'https://github.com/ReneNyffenegger/about-vim'                    , dir => $about_dir };
$repos{'Windows-Registry'            } = {url => 'https://github.com/ReneNyffenegger/about-Windows-Registry'       , dir => $about_dir };
$repos{'wsh'                         } = {url => 'https://github.com/ReneNyffenegger/about-wsh'                    , dir => $about_dir };

$repos{'Ausfluege-Touren-etc'        } = {url => 'https://github.com/ReneNyffenegger/Ausfluege-Touren-etc'         , dir => $github_dir};
$repos{'browser-object-model'        } = {url => 'https://github.com/ReneNyffenegger/Browser-Object-Model'         , dir => $github_dir};
$repos{'data-visualization'          } = {url => 'https://github.com/ReneNyffenegger/data-visualization'           , dir => $github_dir};
$repos{'development_misc'            } = {url => 'https://github.com/ReneNyffenegger/development_misc'             , dir => $github_dir};
$repos{'Fonts'                       } = {url => 'https://github.com/ReneNyffenegger/Fonts'                        , dir => $github_dir};
$repos{'kaggle'                      } = {url => 'https://github.com/ReneNyffenegger/kaggle'                       , dir => $github_dir};
$repos{'oracle-patterns'             } = {url => 'https://github.com/ReneNyffenegger/oracle-patterns'              , dir => $github_dir};
$repos{'oracle_scriptlets'           } = {url => 'https://github.com/ReneNyffenegger/oracle_scriptlets'            , dir => $github_dir};
$repos{'OracleTool'                  } = {url => 'https://github.com/ReneNyffenegger/OracleTool'                   , dir => $github_dir};
$repos{'PerlModules'                 } = {url => 'https://github.com/ReneNyffenegger/PerlModules'                  , dir => $github_dir};
$repos{'printing'                    } = {url => 'https://github.com/ReneNyffenegger/printing'                     , dir => $github_dir};
$repos{'Sprachen'                    } = {url => 'https://github.com/ReneNyffenegger/Sprachen'                     , dir => $github_dir};
$repos{'tq84.css'                    } = {url => 'https://github.com/ReneNyffenegger/tq84.css'                     , dir => $github_dir};
$repos{'Zefix'                       } = {url => 'https://github.com/ReneNyffenegger/Zefix'                        , dir => $github_dir};

mkdir $lib_dir    unless -d $lib_dir;
mkdir $about_dir  unless -d $about_dir;
mkdir $github_dir unless -d $github_dir;

for my $repo (keys %repos) {

  if ($match and $repo !~ /$match/i) {
     next;
  }
  if ($exact and $repo ne $exact) {
     next;
  }

  if (-d "$repos{$repo}{dir}/$repo") {
     print "\n\nRepo $repos{$repo}{dir}/$repo exists, updating it\n";
    
     chdir "$repos{$repo}{dir}/$repo";

     my $git_response = readpipe("git pull");
     print $git_response;
  }
  else {
     chdir $repos{$repo}{dir};

     my $command = "git clone $repos{$repo}{url} $repo";

     print "\n\nRepo $repos{$repo}{dir}/$repo does not exist, cloning it [$command]\n";

     my $git_response = readpipe($command);
     print $git_response;

  }
}


sub usage {
  print "\n";
  print "  $0 exact-expression\n";
  print "  $0 --match regular-expression\n";
  print "  $0 --help\n";
  print "\n";
}
