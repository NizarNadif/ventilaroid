import React from "react";
import {  Link } from "react-router-dom";

// importo i componenti di Ant Design utilizzati
import { Layout, Menu, Row, Col } from 'antd';
import { UserOutlined, LaptopOutlined, RadarChartOutlined } from '@ant-design/icons';

// importo tutti i loghi
import Banner from "../assets/images/banner/banner.png";
import BannerLight from "../assets/images/banner/banner-light.png";

// stile del template
import "../assets/styles/template.css";

// definisco quale componente fornire all'esterno
export default Template;

function Template({component: ComponentJSX}) {
	return (
		<Layout className="layout">
			<Layout.Header 
				style={{ 
					width: '100%',
					height: "115px",
					padding: "30px 50px",
					background: 'transparent',
					fontSize: '15px'
					}}
			>
				<NavBar />
			</Layout.Header>

			<Layout.Content className="content">
				<Content component={ComponentJSX} />
				<Footer />
			</Layout.Content>

			{/* <div className="flow">
				<Content component={ComponentJSX}/>
				<Footer />
			</div> */}
		</Layout>
	);
}

function Content({component: ComponentJSX}) {
	return (
		<div  style={{padding: "10px 100px 100px 100px"}}>
			<ComponentJSX props />
		</div>
	);
}

function NavBar() {
	return (
		<Row align="middle">

			<Col span={8}>
				<Link to="/" >
					<img src={Banner} className="logo" alt="banner-img" width="300px" />
				</Link>
			</Col>

			<Col span={6} offset={10}>
				<Menu style={{background: "transparent"}} mode="horizontal">

				<Menu.Item key={1}  icon={<UserOutlined />}>
					<Link to="/pazienti">
						Pazienti
						</Link>
				</Menu.Item>

				<Menu.Item key={2} icon={<LaptopOutlined />}>
					<Link to="/ventilatori">
						Ventilatori
					</Link>
				</Menu.Item>

				<Menu.Item key={3} icon={<RadarChartOutlined />}>
					<Link to="/statistiche">
						Statistiche
					</Link>
				</Menu.Item>

				</Menu>
			</Col>

		</Row>
	);
}

function Footer() {
	return (
		<Row align="middle" justify="end" className="footer">
			<Col span={12}>ciaone</Col>
			<Col span={12}><img src={BannerLight} alt="banner-inverted-img" /></Col>
		</Row>
	);
}