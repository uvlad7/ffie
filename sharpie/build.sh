#!/usr/bin/env bash
# TODO: generate RID
# https://stackoverflow.com/questions/71679767/how-to-properly-retrieve-dotnet-non-specific-runtime-identifier
# https://learn.microsoft.com/en-us/dotnet/core/rid-catalog#known-rids
dotnet publish /p:NativeLib=Shared --runtime linux-x64 --configuration release \
    && cp bin/release/net8.0/linux-x64/publish/libsharpie.so .
