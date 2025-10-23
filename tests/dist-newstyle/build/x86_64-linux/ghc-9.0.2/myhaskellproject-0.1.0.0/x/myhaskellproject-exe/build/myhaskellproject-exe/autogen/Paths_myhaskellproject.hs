{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_myhaskellproject (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/bastien/.cabal/bin"
libdir     = "/home/bastien/.cabal/lib/x86_64-linux-ghc-9.0.2/myhaskellproject-0.1.0.0-inplace-myhaskellproject-exe"
dynlibdir  = "/home/bastien/.cabal/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/bastien/.cabal/share/x86_64-linux-ghc-9.0.2/myhaskellproject-0.1.0.0"
libexecdir = "/home/bastien/.cabal/libexec/x86_64-linux-ghc-9.0.2/myhaskellproject-0.1.0.0"
sysconfdir = "/home/bastien/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myhaskellproject_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myhaskellproject_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myhaskellproject_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myhaskellproject_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myhaskellproject_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myhaskellproject_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
