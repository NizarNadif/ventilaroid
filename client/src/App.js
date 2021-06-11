import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import Home from "./components/home/Home";
import Patients from "./components/services/Patients";
import Ventilators from "./components/services/Ventilators";
import Statistics from "./components/services/Statistics";
import Error404 from "./components/Error404";
import Error403 from "./components/Error403";

import './assets/styles/App.less';

export function App() {
	return (
		// definisco le rotte private e pubbliche della pagina
		<>
			<BrowserRouter>
				<Switch>
					<Route exact path="/" component={Home} />
					<Route exact path="/ventilatori" component={Ventilators} />
					<Route exact path="/statistiche" component={Statistics} />
					<Route exact path="/pazienti" component={Patients} />
					<Route exact path="/Error403" component={Error403} />
					<Route component={Error404} />
				</Switch>
			</BrowserRouter>
		</>
	);
}