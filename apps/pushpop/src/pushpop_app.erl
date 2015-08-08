%%%-------------------------------------------------------------------
%% @doc pushpop public API
%% @end
%%%-------------------------------------------------------------------

-module('pushpop_app').

-behaviour(application).

%% Application callbacks
-export([start/2,
        connect/0
        ,stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    'pushpop_sup':start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

connect() ->
  ConnSpec = {ssl, <<"imap.google.com">>, 993},
  Auth = {xoauth2, <<"leandro@ostera">>,
           { <<"1/R3l33lDtl9koo2KvOHNs9WYiKuYXBSNjSMDZd0aDlxPBactUREZofsF9C7PrpE-j">>,
             <<"google">> } },
  switchboard:add(ConnSpec, Auth, []).
