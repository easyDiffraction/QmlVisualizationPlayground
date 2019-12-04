/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Charts module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "datasource.h"
#include <QDebug>
#include <QtCharts/QXYSeries>
#include <QtCharts/QAreaSeries>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QtCore/QDebug>
#include <QtCore/QRandomGenerator>
#include <QtCore/QtMath>

DataSource::DataSource(QObject *parent) :
    QObject(parent)
{
}

void DataSource::generateData(int rowCount)
{
    QVector<QPointF> dataPoints;
    dataPoints.reserve(rowCount);
    for (int row = 0; row < rowCount; ++row) {
        qreal x = row/qreal(rowCount);
        qreal y = QRandomGenerator::global()->generateDouble();
        dataPoints.append(QPointF(x, y));
    }
    m_data = dataPoints;
}

void DataSource::update(QAbstractSeries *series, int rowCount)
{
    if (series) {
        QXYSeries *xySeries = static_cast<QXYSeries *>(series);
        if (xySeries->count() > 0) {
            rowCount = xySeries->count();
        }
        generateData(rowCount);
        // Use replace instead of clear + append, it's optimized for performance
        xySeries->replace(m_data);
    }
}
