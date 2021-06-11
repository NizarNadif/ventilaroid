import React from "react";
import { useLocation } from 'react-router-dom';
import { Result } from 'antd';
import Template from './Template';

// definisco quale componente fornire all'esterno
export default Error404;

function Error404(){
	return (
		<Template {...{component: Content}} />
	);
}

function Content() {
	const location = useLocation().pathname.substring(1);
	return (
		<Result
			status="404"
			title="Error 404"
			subTitle={`Scusa, sembra che la pagina "${location}" non esista`}
		/>
	);
}