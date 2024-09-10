var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");


if ( document.location.protocol.toLowerCase() == 'https:' )
{
	document.write( '<scr' + 'ipt src ="https://web.archive.org/web/20141031215230/https://ssl.nx.com/s1/global/ngb_RSAHash.js" type="text/javascript"></scr' + 'ipt>' );
}
else
{
	document.write( '<scr' + 'ipt src ="https://web.archive.org/web/20141031215230/http://js.nx.com/s1/global/ngb_RSAHash.js" type="text/javascript"></scr' + 'ipt>' );
}

var NgbSecurity = new function __NgbSecurity()
{
	var _e;
	var _m;
	var _hash;
	var _handler;
	var _url;
	var _message;
	var _errormessage;
	var _timer;
	var _timeout;
	var _header;
	var _IDPBOWEEOSRJO261 = new Array();

	this.InitData = function()
	{
		if ( typeof( _url ) != 'undefined' && typeof( _timer ) != 'undefined' )
			return;
		
		_IDPBOWEEOSRJO261.length = 0;
	}
	
	this.AddData = function( _266VB5LS7FPA466H )
	{
		if ( typeof( _url ) != 'undefined' && typeof( _timer ) != 'undefined' )
			return;
			
		_IDPBOWEEOSRJO261[ _IDPBOWEEOSRJO261.length ] = _266VB5LS7FPA466H;
	}
	
	this.SetURL = function( url, message, errormessage )
	{
		_url = url;
		_message = message;
		_errormessage = errormessage;
	}
	
	this.SetTimeout = function( timeout )
	{
		_timeout = timeout;
	}
	
	this.SetEncryptInfo = function( e, m, hash )
	{
		_e = e;
		_m = m;
		_hash = hash;
	}
	
	this.Encrypt = function( handler )
	{
		if ( _IDPBOWEEOSRJO261.length == 0 || typeof( handler ) == 'undefined' )
			throw Exception;
			
		_handler = handler;
		
		if ( typeof( _url ) != 'undefined' )
		{
			if ( typeof( _timer ) != 'undefined' )
			{
				if ( typeof( _message ) != 'undefined' )
					alert( _message );
				else
					alert( '요청을 처리중입니다.' );

				return;
			}
			
			if ( typeof( _timeout ) != 'undefined' )
				_timer = setTimeout( 'NgbSecurity.ExpireRequest()',_timeout );
			else
				_timer = setTimeout( 'NgbSecurity.ExpireRequest()', 10000 );
			
			AppendScript( _url );
		}
		else
		{
			if ( typeof( _e ) == 'undefined' || typeof( _m ) == 'undefined' )
				throw Exception;
			
			ProcessEncrypt();
		}
	}
	
	this.ExpireRequest = function()
	{
		clearTimeout( _timer );
		_timer = undefined;

		_IDPBOWEEOSRJO261.length = 0;
		
		if ( typeof( _errormessage ) != 'undefined' )
			alert( _errormessage );
		else
			alert( '요청 시간을 초과하였습니다.' );
	}
	
	this.HandleResponse = function( responseXML )
	{
		if ( typeof( _timer ) != 'undefined' )
		{
			clearTimeout( _timer );
			_timer = undefined;
		
			var resultObject = NxamlParser.ParseXmlText( responseXML );
			EncryptHandler( responseXML, resultObject );
		}
	}
	
	this.HashString = function( _9W073Q921G0GALDN )
	{
		var hashString = NgbHash.HMAC_SHA256_MAC2( "4E65786F6E55736572", _9W073Q921G0GALDN );
		return hashString;
	}
	
	this.HashString2 = function( _P9F2IORGTL1BVJ52, _9W073Q921G0GALDN, _HEFFWC1I54P6UPOD )
	{
		var hashString = _P9F2IORGTL1BVJ52 + NgbHash.HMAC_SHA256_MAC( _HEFFWC1I54P6UPOD, NgbHash.HMAC_SHA256_MAC2( "4E65786F6E55736572", _9W073Q921G0GALDN ));
		return hashString;
	}
	
	var AppendScript = function( src )
	{
		var script = document.createElement( 'script' );
		
		script.src = src;
		script.type = 'text/javascript';
		script.charset = 'ks_c_5601-1987';
	
		document.getElementsByTagName( 'head' )[ 0 ].appendChild( script );
	}
	
	var ProcessEncrypt = function()
	{
		setMaxDigits( 131 );
		
		var key = new NgbRSA.RSAKeyPair( _e, '', _m );
		var _266VB5LS7FPA466H = '';
		
		if ( typeof( _hash ) != 'undefined' )
			_266VB5LS7FPA466H = _hash + '\\';
			
		for ( var i = 0; i < _IDPBOWEEOSRJO261.length; i++ )
		{
			_266VB5LS7FPA466H += NgbRSA.utf8base64encode( _IDPBOWEEOSRJO261[ i ] );
			
			if ( i < _IDPBOWEEOSRJO261.length - 1 )
				_266VB5LS7FPA466H += '\\';
		}
		
		var val = EncryptString( key, _266VB5LS7FPA466H );
		_IDPBOWEEOSRJO261.length = 0;
		
		_handler( val );
	}
	
	var EncryptHandler = function( responseXML, resultObject )
	{
		if ( typeof( resultObject.result.e ) != 'undefined' 
			&& typeof( resultObject.result.m ) != 'undefined' 
			&& typeof( resultObject.result.h ) != 'undefined' )
		{
			_e = resultObject.result.e;
			_m = resultObject.result.m;
			_hash = resultObject.result.h;
			
			ProcessEncrypt();
		}
		else
		{
			alert( "로그인 처리과정 중 오류가 발생하였습니다." );
			return;
		}
	}
	
	var EncryptString = function( key, _UEKMSSRU9D25K94I )
	{
		if ( key.chunkSize > key.digitSize - 11 )
		{
			return 'Error';
		}
		
		var a = new Array();
		var sl = _UEKMSSRU9D25K94I.length;
		
		var i = 0;
		while ( i < sl )
		{
			a[ i ] = _UEKMSSRU9D25K94I.charCodeAt( i );
			i++;
		}
		
		var al = a.length;
		var result = '';
		var j, k, block;
		for ( i = 0; i < al; i += key.chunkSize )
		{
			block = new BigInt();
			j = 0;
			var x;
			var msgLength = ( i + key.chunkSize ) > al ? al % key.chunkSize : key.chunkSize;
			
			var b = new Array();
			for ( x = 0; x < msgLength; x++ )
			{
				b[ x ] = a[ i + msgLength - 1 - x ];
			}
			b[ msgLength ] = 0;
			var paddedSize = Math.max( 8, key.digitSize - 3 - msgLength );
		
			for ( x = 0; x < paddedSize; x++ )
			{
				b[ msgLength + 1 + x ] = Math.floor(Math.random() * 254) + 1;
			}
			b[ key.digitSize - 2 ] = 2;
			b[ key.digitSize - 1 ] = 0;
			
			for ( k = 0; k < key.digitSize; ++j )
			{
				block.digits[ j ] = b[ k++ ];
				block.digits[ j ] += b[ k++ ] << 8;
			}

			var crypt = key.barrett.powMod( block, key.e );
			var text = key.radix == 16 ? biToHex( crypt ) : biToString( crypt, key.radix );
			result += text + ' ';
		}
		
		return result.substring( 0, result.length - 1 );
	}
}

var NgbLogin = new function __NgbLogin()
{
	var _isLoginProcessing = false;
	
	var _codeRegSite = 0;
	var _strRedirect;
	var _isPhone = false;
	var _header;
	var _hashKey;
	var __HYRYTF002NA9Q0SA;
	var __E9OURR2B4DOSTT8F;
	var _codeRegSite;
	var _strRedirect;
	var _isPhone;
	var _isLogin2;
	var _callBackMethod;
	
	var _hashtimer;
	
	var _97OF8ELP79IR8S4C;
	
	var _isInvalidPasswordHashKeyString = false;
	var _isFailover = false;
	
	this.SetData = function( _HYRYTF002NA9Q0SA, _E9OURR2B4DOSTT8F, codeRegSite, strRedirect, isPhone )
	{
		__HYRYTF002NA9Q0SA = _HYRYTF002NA9Q0SA;
		__E9OURR2B4DOSTT8F = _E9OURR2B4DOSTT8F;
		_codeRegSite = codeRegSite;
		_strRedirect = strRedirect;
		_isPhone = isPhone;
	}
	
	this.InitLoginProcessing = function()
	{
		_isLoginProcessing = false;
	}
	
	this.SubmitLogin = function()
	{
		var strDomain = NgbLogin.GetLoginURL();
		var strEncData = arguments [ 1 ][ 0 ];
		var codeRegSite = arguments [ 1 ][ 1 ];
		var strRedirect = arguments [ 1 ][ 2 ];
		var isPhone = arguments [ 1 ][ 3 ];
		var isLogin2 = arguments [ 1 ][ 4 ];
		var strCallBackMethod = arguments [ 1 ][ 5 ];

		if ( strEncData == 'Error' )
		{
			alert( "로그인 처리과정 중 오류가 발생하였습니다." );
			return false;
		}
		
		if ( _isLoginProcessing )
		{
			alert( "로그인 하는 중입니다. 잠시만 기다려주세요." );
			return false;
		}
		_isLoginProcessing = true;
		
		if( isLogin2 == false )
		{		
			NgbClientForm.AddChildForSubform( 'strEncData', strEncData );
			NgbClientForm.AddChildForSubform( 'codeRegSite', codeRegSite );
			
			if ( typeof( strRedirect ) != 'undefined' )
				NgbClientForm.AddChildForSubform( 'strRedirect', strRedirect );
				
			if ( typeof( isPhone ) == 'undefined' )
				isPhone = false;

			if ( isPhone == false )
				NgbClientForm.SubmitForm( 'https://' + strDomain + '/login/page/loginproc.aspx' );
			else
				NgbClientForm.SubmitForm( 'https://' + strDomain + '/login/page/loginphone.aspx' );
		}
		else
		{
			var iframe;
			
			try
			{
				iframe = document.createElement( "<iframe name='iframe1' />" );
			} catch ( ex ) {
				iframe = document.createElement( "iframe" );
				iframe.name = "iframe1";
			}
			
			iframe.src = "javascript:'<script>window.onload=function(){document.write(\\'<script>document.domain=\\\"nexon.com\\\";<\\\\/script>\\');document.close();};<\/script>'";
			iframe.style.display = "none";
			document.body.appendChild( iframe ); 

			var encData = document.createElement( "input" );
			encData.setAttribute( "type", "hidden" );
			encData.setAttribute( "name", "strEncData" );
			encData.setAttribute( "value", strEncData );
			
			var callBackMethod = document.createElement( "input" );
			callBackMethod.setAttribute( "type", "hidden" );
			callBackMethod.setAttribute( "name", "strCallBackMethod" );
			callBackMethod.setAttribute( "value", strCallBackMethod );

			var form = document.createElement( "form" );
			form.method = "post";
			form.target = "iframe1";
			form.action = "https://" + strDomain + "/login/page/loginproc2.aspx";
			form.appendChild( encData );
			form.appendChild( callBackMethod );

			document.body.appendChild( form );
			
			NgbLogin.PollSubmit( form );
		}
	}
	
	this.PollSubmit = function( form )
	{
		try
		{
			form.submit();
		}
		catch( e )
		{
			setTimeout(function() { // set a timeout to give browsers a chance to recognize the <iframe> 
				NgbLogin.PollSubmit( form );
			}, 100 );
		}
	}

	this.Login = function( _HYRYTF002NA9Q0SA, _E9OURR2B4DOSTT8F, codeRegSite, strRedirect, isPhone )
	{
		NgbLogin.SetData( _HYRYTF002NA9Q0SA, _E9OURR2B4DOSTT8F, codeRegSite, strRedirect, isPhone );
		_isLogin2 = false;
		
		if ( _HYRYTF002NA9Q0SA.indexOf( '@' ) != -1 )
		{
			var arrEmail = _HYRYTF002NA9Q0SA.split( '@' );
			
			if ( arrEmail.length != 2 || arrEmail[ 0 ] == '' || arrEmail[ 1 ] == '' || _HYRYTF002NA9Q0SA.indexOf( ' ' ) != -1 )
			{
				alert( '아이디를 확인해 주세요.' );
				return;
			}
			
			if ( typeof( _hashtimer ) != 'undefined' )
			{
				alert( '로그인 하는 중입니다. 잠시만 기다려주세요.' );
				return;
			}
			
			_isFailover = false;
			_97OF8ELP79IR8S4C = _HYRYTF002NA9Q0SA;
			AuthSystem.GetPasswordHashKey( _HYRYTF002NA9Q0SA, NgbLogin.HashHandler );
			
			_hashtimer = setTimeout( 'NgbLogin.ExpireHashProcess()', 5000 );
		}
		else
		{
			NgbLogin.MemberLogin()
		}
	}
	
	this.Login2 = function( _HYRYTF002NA9Q0SA, _E9OURR2B4DOSTT8F, callBackMethod )
	{
		if( typeof( callBackMethod ) == "undefined" || callBackMethod == "" )
		{
			alert( "로그인 처리과정 중 오류가 발생하였습니다." );
			return;
		}
		
		NgbLogin.SetData( _HYRYTF002NA9Q0SA, _E9OURR2B4DOSTT8F );
		_isLogin2 = true;
		_callBackMethod = callBackMethod;
		
		if ( _HYRYTF002NA9Q0SA.indexOf( '@' ) != -1 )
		{
			var arrEmail = _HYRYTF002NA9Q0SA.split( '@' );
			
			if ( arrEmail.length != 2 || arrEmail[ 0 ] == '' || arrEmail[ 1 ] == '' )
			{
				alert( '아이디를 확인해 주세요.' );
				return;
			}
			
			if ( typeof( _hashtimer ) != 'undefined' )
			{
				alert( '로그인 하는 중입니다. 잠시만 기다려주세요.' );
				return;
			}
			
			_isFailover = false;
			_97OF8ELP79IR8S4C = _HYRYTF002NA9Q0SA;
			AuthSystem.GetPasswordHashKey( _HYRYTF002NA9Q0SA, NgbLogin.HashHandler );
			
			_hashtimer = setTimeout( 'NgbLogin.ExpireHashProcess()', 5000 );
		}
		else
		{
			NgbLogin.MemberLogin()
		}
	}
	
	this.ExpireHashProcess = function()
	{
		clearTimeout( _hashtimer );
		_hashtimer = undefined;
		alert( '요청 시간을 초과하였습니다.' );
	}
	
	this.MemberLogin = function()
	{
		_HYRYTF002NA9Q0SA = __HYRYTF002NA9Q0SA;
		_E9OURR2B4DOSTT8F = __E9OURR2B4DOSTT8F;
		codeRegSite = _codeRegSite;
		strRedirect = _strRedirect;
		isPhone = _isPhone;
		
		var strDomain = NgbLogin.GetLoginURL();
		_HYRYTF002NA9Q0SA = NgbString.Trim( _HYRYTF002NA9Q0SA );
		_E9OURR2B4DOSTT8F = NgbString.Trim( _E9OURR2B4DOSTT8F );
		
		if ( typeof( codeRegSite ) == 'undefined' )
			codeRegSite = 0;
			
		if ( typeof( isPhone ) == 'undefined' )
			isPhone = false;
			
		if ( _HYRYTF002NA9Q0SA == '' || _HYRYTF002NA9Q0SA.indexOf( ' ' ) != -1 )
		{
			alert( '아이디를 입력해 주세요.' );
			return;
		}
		else if ( _E9OURR2B4DOSTT8F == '' )
		{
			alert( '비밀번호를 입력해 주세요.' );
			return;
		}
		
		_codeRegSite = codeRegSite;
		_strRedirect = strRedirect;
		_isPhone = isPhone;
		
		try
		{
			NgbSecurity.InitData();
			
			NgbSecurity.AddData( _HYRYTF002NA9Q0SA );
			NgbSecurity.AddData( _HYRYTF002NA9Q0SA.indexOf( '@' ) != -1 ? NgbSecurity.HashString2( _header, _E9OURR2B4DOSTT8F, _hashKey ) : _E9OURR2B4DOSTT8F );
			
			NgbSecurity.SetURL( 'https://' + strDomain + '/login/page/encryptinfo.aspx', '로그인 하는 중입니다. 잠시만 기다려주세요.' );
			NgbSecurity.Encrypt( NgbLogin.EncryptHandler );
		}
		catch( e )
		{
			NgbEVM.AddCommand( NgbEVM.k_nEventType_onPageEnd, new NgbEVMDelegator( NgbLogin.SubmitLogin ), '', _codeRegSite, _strRedirect, _isPhone, _isLogin2, _callBackMethod );
		}
	}
	
	this.EncryptHandler = function( encData )
	{
		NgbEVM.AddCommand( NgbEVM.k_nEventType_onPageEnd, new NgbEVMDelegator( NgbLogin.SubmitLogin ), encData, _codeRegSite, _strRedirect, _isPhone, _isLogin2, _callBackMethod );
	}

	this.Logout = function( strURL )
	{
		var strDomain = NgbLogin.GetLoginURL();
	
		if ( typeof( strURL ) == 'undefined' )
			strURL = document.location.href;
		
		document.location.href = 'http://' + strDomain + '/login/page/logout.aspx?redirect=' + escape( strURL );
	}
	
	this.GetLoginURL = function()
	{
		var strDomain;
		
		try
		{
			strDomain = NgbUrl.GetDomainURL();
		}
		catch ( e )
		{
			strDomain = 'login.nexon.com';
		}
		
		switch ( strDomain )
		{
			case 'df.nexon.com' : 
			case 'dflogin.nexon.com' : 
				return 'dflogin.nexon.com';
				
			case 'fsf.nexon.com' : 
			case 'fsf-cont.nexon.com' : 
			case 'fsf-help.nexon.com' : 
			case 'fsflogin.nexon.com' : 
				return 'fsflogin.nexon.com';
				
			default : 
				return 'login.nexon.com';
		}
	}
	
	this.HashHandler = function( resultObject, responseXML )
	{
		try
		{
			clearTimeout( _hashtimer );
			_hashtimer = undefined;
		
			if ( typeof( resultObject.PasswordHashKeyString ) != 'undefined' && resultObject.PasswordHashKeyString != '' )
			{
				var result = resultObject.PasswordHashKeyString;
				var info = result.split(':');
				_header = info[0] + ':' + info[1] + ':' + info[2] + ':';
				_hashKey = info[3];
				
				_isInvalidPasswordHashKeyString = false;
			}
			else
			{
				_isInvalidPasswordHashKeyString = true;
			}
		}
		catch ( e )
		{
			_isInvalidPasswordHashKeyString = true;
		}
		
		if ( _isInvalidPasswordHashKeyString == true )
		{
			alert( "로그인 처리과정 중 오류가 발생하였습니다." );
			return;
		}
		else
		{
			NgbLogin.MemberLogin();
		}
	}
}


}
/*
     FILE ARCHIVED ON 21:52:30 Oct 31, 2014 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 00:31:29 Sep 10, 2024.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.577
  exclusion.robots: 0.018
  exclusion.robots.policy: 0.008
  esindex: 0.01
  cdx.remote: 23.031
  LoadShardBlock: 121.392 (6)
  PetaboxLoader3.datanode: 79.796 (7)
  PetaboxLoader3.resolve: 41.834
  load_resource: 22.103
*/